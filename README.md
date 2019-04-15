NAME
====

Constants::Sys::Socket - Socket constants defined in sys/socket.h

SYNOPSIS
========

```perl6
use Constants::Sys::Socket :SOCK, :AF, :SO, :SOL;

say SOCK::DGRAM;

say AF::INET6;

say SO::REUSEADDR;

say SOL::SOCKET; #The only value in the enum

say SOCK.enums.keys;

say AF.enums.keys;

say SO.enums.keys;
```

DESCRIPTION
===========

Constants::Sys::Socket contains many enumerated values that are implemented as #define directives in <sys/socket.h>.

This module should be compatible with windows, macos, linux, netbsd, freebsd, openbsd, and dragonflybsd. Each platform will receive a slightly different enumerations.

Based on C headers found on official sites and unofficial mirrors of source trees.

AUTHOR
======

Travis Gibson <TGib.Travis@protonmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 Travis Gibson

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

