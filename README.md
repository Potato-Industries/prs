# prs

portable Pony based reverse shell

https://www.ponylang.io/

**Cross Compile**

https://github.com/vassilvk/cross-pony-docker


```
➜  prs ls 
main.pony
➜  prs docker run --rm -it -v /$(pwd):/src/main vassilvk/cross-pony linux-amd64 
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
Triple set to x86_64-pc-linux-gnu
Target CPU set to x86-64
Compiling pony to LLVM bitcode...
Building builtin -> /usr/local/lib/pony/0.21.3/packages/builtin
Building . -> /src/main
Building net -> /usr/local/lib/pony/0.21.3/packages/net
Building collections -> /usr/local/lib/pony/0.21.3/packages/collections
Building ponytest -> /usr/local/lib/pony/0.21.3/packages/ponytest
Building time -> /usr/local/lib/pony/0.21.3/packages/time
Building process -> /usr/local/lib/pony/0.21.3/packages/process
Building backpressure -> /usr/local/lib/pony/0.21.3/packages/backpressure
Building files -> /usr/local/lib/pony/0.21.3/packages/files
Building buffered -> /usr/local/lib/pony/0.21.3/packages/buffered
Building term -> /usr/local/lib/pony/0.21.3/packages/term
Building promises -> /usr/local/lib/pony/0.21.3/packages/promises
Building strings -> /usr/local/lib/pony/0.21.3/packages/strings
Building signals -> /usr/local/lib/pony/0.21.3/packages/signals
Building capsicum -> /usr/local/lib/pony/0.21.3/packages/capsicum
Generating
 Reachability
 Selector painting
 Data prototypes
 Data types
 Function prototypes
 Functions
 Descriptors
Optimising
Writing ./main.bc
Compiling bitcode to object code...
Linking executable => ./main-linux-amd64
Done
➜  prs file main-linux-amd64 
main-linux-amd64: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, not stripped

```

Enjoy~
