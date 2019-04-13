use v6.c;

=begin pod

=head1 NAME

Constants::Sys::Socket - Socket constants defined in sys/socket.h

=head1 SYNOPSIS

=begin code :lang<perl6>

use Constants::Sys::Socket :SO, :AF;

say AF::INET6;

say SO::REUSEADDR;

=end code

=head1 DESCRIPTION

Constants::Sys::Socket contains many enumerated values that are implemented as #define directives.

=head1 AUTHOR

Travis Gibson <TGib.Travis@protonmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 Travis Gibson

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
unit module Constants::Sys::Socket:ver<0.0.1>:auth<cpan:GARLANDG>;

#Here be dragons

constant SO is export(:SO) := $*KERNEL.name eq 'linux' ?? do {
  my enum SO (
    DEBUG => 1,
    REUSEADDR => 2,
    TYPE => 3,
    ERROR => 4,
    DONTROUTE => 5,
    BROADCAST => 6,
    SNDBUF => 7,
    RCVBUF => 8,
    KEEPALIVE => 9,
    OOBINLINE => 10,
    LINGER => 13,
    REUSEPORT => 15,
    RCVLOWAT => 18,
    SNDLOWAT => 19,
    RCVTIMEO => 20,
    SNDTIMEO => 21,
    ACCEPTCONN => 30,
  );
  SO;
}
!! ($*KERNEL.name eq any('netbsd') ?? do { #windows, #netbsd
  my enum SO (
    DEBUG => 0x0001,
    ACCEPTCONN => 0x0002,
    REUSEADDR => 0x0004,
    KEEPALIVE => 0x0008,
    DONTROUTE => 0x0010,
    BROADCAST => 0x0020,
    USELOOPBACK => 0x0040,
    LINGER => 0x0080,
    OOBINLINE => 0x0100,
    REUSEPORT => 0x0200,
    NOSIGPIPE => 0x0800,
    ACCEPTFILTER => 0x1000,
    TIMESTAMP => 0x2000,
    RERROR => 0x4000,
  );
  SO;
}
!! ($*KERNEL.name eq any('dragonflybsd') ?? do {
  my enum SO (
    DEBUG => 0x0001,
    ACCEPTCONN => 0x0002,
    REUSEADDR => 0x0004,
    KEEPALIVE => 0x0008,
    DONTROUTE => 0x0010,
    BROADCAST => 0x0020,
    USELOOPBACK => 0x0040,
    LINGER => 0x0080,
    OOBINLINE => 0x0100,
    REUSEPORT => 0x0200,
    TIMESTAMP => 0x0400,
    NOSIGPIPE => 0x0800,
    ACCEPTFILTER => 0x1000,
    SNDBUF => 0x1001,
    RCVBUF => 0x1002,
    SNDLOWAT => 0x1003,
    RCVLOWAT => 0x1004,
    SNDTIMEO => 0x1005,
    RCVTIME0 => 0x1006,
    ERROR => 0x1007,
    TYPE => 0x1008,
  );
  SO;
}
!! ($*DISTRO.is-win() ?? do {
  my enum SO (
    DEBUG => 0x0001,
    ACCEPTCONN => 0x0002,
    REUSEADDR => 0x0004,
    KEEPALIVE => 0x0008,
    DONTROUTE => 0x0010,
    BROADCAST => 0x0020,
    USELOOPBACK => 0x0040,
    LINGER => 0x0080,
    OOBINLINE => 0x0100,
    SNDBUF => 0x1001,
    RCVBUF => 0x1002,
    SNDLOWAT => 0x1003,
    RCVLOWAT => 0x1004,
    SNDTIMEO => 0x1005,
    RCVTIME0 => 0x1006,
    ERROR => 0x1007,
    TYPE => 0x1008,
    BSP_STATE => 0x1009,
  );
  SO;
}
!! ($*KERNEL.name eq 'freebsd' ?? do {
  my enum SO (
    DEBUG => 0x0001,
    ACCEPTCONN => 0x0002,
    REUSEADDR => 0x0004,
    KEEPALIVE => 0x0008,
    DONTROUTE => 0x0010,
    BROADCAST => 0x0020,
    USELOOPBACK => 0x0040,
    LINGER => 0x0080,
    OOBINLINE => 0x0100,
    REUSEPORT => 0x0200,
    TIMESTAMP => 0x0400,
    NOSIGPIPE => 0x0800,
    ACCEPTFILTER => 0x1000,
    SNDBUF => 0x1001,
    RCVBUF => 0x1002,
    SNDLOWAT => 0x1003,
    RCVLOWAT => 0x1004,
    SNDTIMEO => 0x1005,
    RCVTIME0 => 0x1006,
    ERROR => 0x1007,
    TYPE => 0x1008,
  );
  SO;
}
!! ($*KERNEL.name eq 'openbsd' ?? do {
  my enum SO (
    DEBUG => 0x0001,
    ACCEPTCONN => 0x0002,
    REUSEADDR => 0x0004,
    KEEPALIVE => 0x0008,
    DONTROUTE => 0x0010,
    BROADCAST => 0x0020,
    USELOOPBACK => 0x0040,
    LINGER => 0x0080,
    OOBINLINE => 0x0100,
    REUSEPORT => 0x0200,
    TIMESTAMP => 0x0800,
    SNDBUF => 0x1001,
    RCVBUF => 0x1002,
    SNDLOWAT => 0x1003,
    RCVLOWAT => 0x1004,
    SNDTIMEO => 0x1005,
    RCVTIME0 => 0x1006,
    ERROR => 0x1007,
    TYPE => 0x1008,
  );
  SO;
}
!! do { #macosx
  my enum SO (
    DEBUG => 0x0001,
    ACCEPTCONN => 0x0002,
    REUSEADDR => 0x0004,
    KEEPALIVE => 0x0008,
    DONTROUTE => 0x0010,
    BROADCAST => 0x0020,
    USELOOPBACK => 0x0040,
    LINGER => 0x0080,
    OOBINLINE => 0x0100,
    REUSEPORT => 0x0200,
    TIMESTAMP => 0x0400,
    TIMESTAMP_MONOTONIC => 0x0800,
    SNDBUF => 0x1001,
    RCVBUF => 0x1002,
    SNDLOWAT => 0x1003,
    RCVLOWAT => 0x1004,
    SNDTIMEO => 0x1005,
    RCVTIME0 => 0x1006,
    ERROR => 0x1007,
    TYPE => 0x1008,
    NOSIGPIPE => 1022,
  );
  SO;
}
)))));

constant AF is export(:AF) := $*KERNEL.name eq 'linux' ?? do {
  my enum AF (
    UNSPEC => 0,
    LOCAL => 1,
    UNIX => 1,
    FILE => 1,
    INET => 2,
    AX25 => 3,
    IPX => 4,
    APPLETALK => 5,
    NETROM => 6,
    BRIDGE => 7,
    ATMPVC => 8,
    X25 => 9,
    INET6 => 10,
    ROSE => 11,
    DECnet => 12,
    NETBEUI => 13,
    SECURITY => 14,
    KEY => 15,
    NETLINK => 16,
    ROUTE => 16,
    PACKET => 17,
    ASH => 18,
    ECONET => 19,
    ATMSVC => 20,
    RDS => 21,
    SNA => 22,
    IRDA => 23,
    PPPOX => 24,
    WANPIPE => 25,
    LLC => 26,
    IB => 27,
    MPLS => 28,
    CAN => 29,
    TIPC => 30,
    BLUETOOTH => 31,
    IUCV => 32,
    RXRPC => 33,
    ISDN => 34,
    PHONET => 35,
    IEEE802154 => 36,
    CAIF => 37,
    ALG => 38,
    NFC => 39,
    VSOCK => 40,
    KCM => 41,
    QIPCRTR => 42,
    SMC => 43,
    MAX => 44,
  );
  AF;
}
!! ($*KERNEL.name eq any('netbsd') ?? do {
  my enum AF (
    UNSPEC => 0,
    LOCAL => 1,
    UNIX => 1,
    INET => 2,
    IMPLINK => 3,
    PUP => 4,
    CHAOS => 5,
    NS => 6,
    ISO => 7,
    OSI => 7,
    ECMA => 8,
    DATAKIT => 9,
    CCITT => 10,
    SNA => 11,
    DECnet => 12,
    DLI => 13,
    LAT => 14,
    HYLINK => 15,
    APPLETALK => 16,
    OROUTE => 17,
    LINK => 18,
    XTP => 19,
    COIP => 20,
    CNT => 21,
    RTIP => 22,
    IPX => 23,
    INET6 => 24,
    PIP => 25,
    ISDN => 26,
    E164 => 26,
    NATM => 27,
    ARP => 28,
    KEY => 29,
    HDRCMPLT => 30,
    BLUETOOTH => 31,
    IEEE802154 => 32,
    MPLS => 33,
    ROUTE => 34,
    CAN => 35,
    ETHER => 36,
    MAX => 37,
  );
  AF;
}
!! ($*KERNEL.name eq any('dragonflybsd') ?? do {
  my enum AF (
    UNSPEC => 0,
    LOCAL => 1,
    UNIX => 1,
    INET => 2,
    IMPLINK => 3,
    PUP => 4,
    CHAOS => 5,
    NETBIOS => 6,
    ISO => 7,
    OSI => 7,
    ECMA => 8,
    DATAKIT => 9,
    CCITT => 10,
    SNA => 11,
    DECnet => 12,
    DLI => 13,
    LAT => 14,
    HYLINK => 15,
    APPLETALK => 16,
    ROUTE => 17,
    LINK => 18,
    XTP => 19,
    COIP => 20,
    CNT => 21,
    RTIP => 22,
    IPX => 23,
    SIP => 24,
    PIP => 25,
    ISDN => 26,
    E164 => 26,
    KEY => 27,
    INET6 => 28,
    NATM => 29,
    ATM => 30,
    HDRCMPLT => 31,
    NETGRAPH => 32,
    BLUETOOTH => 33,
    MPLS => 34,
    IEEE80211 => 35,
    MAX => 36,
  );
  AF;
}
!! ($*DISTRO.is-win() ?? do {
  my enum AF (
    UNSPEC => 0,
    UNIX => 1,
    INET => 2,
    IMPLINK => 3,
    PUP => 4,
    CHAOS => 5,
    NS => 6,
    IPX => 6,
    ISO => 7,
    OSI => 7,
    ECMA => 8,
    DATAKIT => 9,
    CCITT => 10,
    SNA => 11,
    DECnet => 12,
    DLI => 13,
    LAT => 14,
    HYLINK => 15,
    APPLETALK => 16,
    NETBIOS => 17,
    VOICEVIEW => 18,
    FIREFOX => 19,
    UNKNOWN1 => 20,
    BAN => 21,
    ATM => 22,
    INET6 => 23,
    CLUSTER => 24,
    12844 => 25,
    IRDA => 26,
    BTH => 32,
    BLUETOOTH => 32,
    MAX => 27,
  );
  AF;
}
!! ($*KERNEL.name eq 'freebsd' ?? do {
  my enum AF (
    UNSPEC => 0,
    LOCAL => 1,
    UNIX => 1,
    INET => 2,
    IMPLINK => 3,
    PUP => 4,
    CHAOS => 5,
    NETBIOS => 6,
    ISO => 7,
    OSI => 7,
    ECMA => 8,
    DATAKIT => 9,
    CCITT => 10,
    SNA => 11,
    DECnet => 12,
    DLI => 13,
    LAT => 14,
    HYLINK => 15,
    APPLETALK => 16,
    ROUTE => 17,
    LINK => 18,
    XTP => 19,
    COIP => 20,
    CNT => 21,
    RTIP => 22,
    IPX => 23,
    SIP => 24,
    PIP => 25,
    ISDN => 26,
    E164 => 26,
    KEY => 27,
    INET6 => 28,
    NATM => 29,
    ATM => 30,
    HDRCMPLT => 31,
    NETGRAPH => 32,
    SLOW => 33,
    SCLUSTER => 34,
    ARP => 35,
    BLUETOOTH => 36,
    IEEE80211 => 37,
    INET_SDP => 40,
    INET6_SDP => 42,
    MAX => 42,
  );
  AF;
}
!! ($*KERNEL.name eq 'openbsd' ?? do {
  my enum AF (
    UNSPEC => 0,
    LOCAL => 1,
    UNIX => 1,
    INET => 2,
    IMPLINK => 3,
    PUP => 4,
    CHAOS => 5,
    NS => 6,
    ISO => 7,
    OSI => 7,
    ECMA => 8,
    DATAKIT => 9,
    CCITT => 10,
    SNA => 11,
    DECnet => 12,
    DLI => 13,
    LAT => 14,
    HYLINK => 15,
    APPLETALK => 16,
    ROUTE => 17,
    LINK => 18,
    XTP => 19,
    COIP => 20,
    CNT => 21,
    RTIP => 22,
    IPX => 23,
    INET6 => 24,
    PIP => 25,
    ISDN => 26,
    E164 => 26,
    NATM => 27,
    ENCAP => 28,
    SIP => 29,
    KEY => 30,
    HDRCMPLT => 31,
    BLUETOOTH => 32,
    MPLS => 33,
    PFLOW => 34,
    PIPEX => 35,
    MAX => 36,
  );
  AF;
}
!! do { #macosx
  my enum AF (
    UNSPEC => 0,
    LOCAL => 1,
    UNIX => 1,
    INET => 2,
    IMPLINK => 3,
    PUP => 4,
    CHAOS => 5,
    NS => 6,
    ISO => 7,
    OSI => 7,
    ECMA => 8,
    DATAKIT => 9,
    CCITT => 10,
    SNA => 11,
    DECnet => 12,
    DLI => 13,
    LAT => 14,
    HYLINK => 15,
    APPLETALK => 16,
    ROUTE => 17,
    LINK => 18,
    XTP => 19,
    COIP => 20,
    CNT => 21,
    RTIP => 22,
    IPX => 23,
    SIP => 24,
    PIP => 25,
    NDRV => 27,
    ISDN => 28,
    E164 => 28,
    KEY => 29,
    INET6 => 30,
    NATM => 31,
    SYSTEM => 32,
    NETBIOS => 33,
    PPP => 34,
    HDRCMPLT => 35,
    RESERVED_36 => 36,
    IEEE80211 => 37,
    UTUN => 38,
    MAX => 39,
  );
  AF;
}
)))));
