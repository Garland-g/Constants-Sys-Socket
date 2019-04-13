NAME
====

Constants::Sys::Socket - Socket constants defined in sys/socket.h

SYNOPSIS
========

```perl6
use Constants::Sys::Socket :SO, :AF;

say AF::INET6;

say SO::REUSEADDR;
```

DESCRIPTION
===========

Constants::Sys::Socket contains many enumerated values that are implemented as #define directives.

AUTHOR
======

Travis Gibson <TGib.Travis@protonmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2019 Travis Gibson

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

