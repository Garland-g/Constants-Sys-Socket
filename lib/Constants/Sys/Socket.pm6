use v6.c;

=begin pod

=head1 NAME

Constants::Sys::Socket - Socket constants defined in sys/socket.h

=head1 SYNOPSIS

=begin code :lang<perl6>

use Constants::Sys::Socket :SOCK, :AF, :SO, :SOL;

say SOCK::DGRAM;

say AF::INET6;

say SO::REUSEADDR;

say SOL::SOCKET; #The only value in the enum

say SOCK.enums.keys;

say AF.enums.keys;

say SO.enums.keys;

=end code

=head1 DESCRIPTION

Constants::Sys::Socket contains many enumerated values that are implemented as #define directives in <sys/socket.h>.

This module should be compatible with windows, macos, linux, netbsd, freebsd, openbsd, and dragonflybsd.
Each platform will receive a slightly different enumerations.

Based on C headers found on official sites and unofficial mirrors of source trees.

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
    BINDTODEVICE => 25,
    GET_FILTER => 26,
    ATTACH_FILTER => 26,
    DETACH_FILTER => 27,
    PEERNAME => 28,
    ACCEPTCONN => 30,
    PEERSEC => 31,
    PASSSEC => 34,
    MARK => 36,
    PROTOCOL => 38,
    DOMAIN => 39,
    RXQ_OVFL => 40,
    WIFI_STATUS => 41,
    PEEK_OFF => 42,
    NOFCS => 43,
    LOCK_FILTER => 44,
    SELECT_ERR_QUEUE => 45,
    BUSY_POLL => 46,
    MAX_PACING_RATE => 47,
    BPF_EXTENSIONS => 48,
    INCOMING_CPU => 49,
    ATTACH_BPF => 50,
    DETACH_BPF => 50,
    ATTACH_REUSEPORT_CBPF => 51,
    ATTACH_REUSEPORT_EBPF => 52,
    CNX_ADVICE => 53,
    TIMESTAMPING_OPT_STATS => 54,
    MEMINFO => 55,
    INCOMING_NAPI_ID => 56,
    COOKIE => 57,
    SCM_TIMESTAMPING_PKTINFO => 58,
    PEERGROUPS => 59,
    ZEROCOPY => 60,
    TXTTIME => 61,
    BINDTOIFINDEX => 62,
    TIMESTAMP_OLD => 29,
    TIMESTAMPNS_OLD => 35,
    TIMESTAMPING_OLD => 37,
    TIMESTAMP_NEW => 63,
    TIMESTAMPNS_NEW => 64,
    TIMESTAMPING_NEW => 65,
    RCVTIMEO_NEW => 66,
    SNDTIMEO_NEW => 67,
  );
  SO;
}
!! ($*KERNEL.name eq any('netbsd') ?? do {
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
    GROUP_ID => 0x2001,
    GROUP_PRIORITY => 0x2002,
    MAX_MSG_SIZE => 0x2003,
    PROTOCOL_INFOA => 0x2004,
    PROTOCOL_INFOW => 0x2005,
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
    LABEL => 0x1009,
    PEERLABEL => 0x1010,
    LISTENQLIMIT => 0x1011,
    LISTENQLEN => 0x1012,
    LISTENINCQLEN => 0x1013,
    SETFIB => 0x1014,
    USER_COOKIE => 0x1015,
    PROTOCOL => 0x1016,
    PROTOTYPE => 0x1016,
    TS_CLOCK => 0x1017,
    MAX_PACING_RATE => 0x1018,
    DOMAIN => 0x1019,
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
    NETPROC => 0x1020,
    RTABLE => 0x1021,
    PEERCRED => 0x1022,
    SPLICE => 0x1023,
    DOMAIN => 0x1024,
    PROTOCOL => 0x1025,
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
    NOSIGPIPE => 0x1022,
    NOADDRERR => 0x1023,
    NWRITE => 0x1024,
    REUSESHAREUID => 0x1025,
    NOTIFYCONFLICT => 0x1026,
    UPCALLCLOSEWAIT => 0x1027,
    LINGER_SEC => 0x1080,
    RESTRICTIONS => 0x1081,
    RESTRICT_DENY_IN => 0x1,
    RESTRICT_DENY_OUT => 0x2,
    RESTRICT_DENY_CELLULAR => 0x4,
    RESTRICT_DENY_EXPENSIVE => 0x8,
    RANDOMPORT => 0x1082,
    NP_EXTENSIONS => 0x1083,
    EXECPATH => 0x1085,
  );
  SO;
}
)))));

constant SOCK is export(:SOCK) := $*KERNEL.name eq 'linux' ?? do {
  my enum SOCK (
    STREAM => 1,
    DGRAM => 2,
    RAW => 3,
    RDM => 4,
    SEQPACKET => 5,
    DCCP => 6,
    PACKET => 10,
  );
  SOCK;
}
!! ($*KERNEL.name eq any('netbsd') ?? do {
  my enum SOCK (
    STREAM => 1,
    DGRAM => 2,
    RAW => 3,
    RDM => 4,
    SEQPACKET => 5,
    CONN_DGRAM => 6,
    DCCP => 6,
    PACKET => 10,
  );
  SOCK;
}
!! ($*KERNEL.name eq any('dragonflybsd') ?? do {
  my enum SOCK (
    STREAM => 1,
    DGRAM => 2,
    RAW => 3,
    RDM => 4,
    SEQPACKET => 5,
  );
  SOCK;
}
!! ($*DISTRO.is-win() ?? do {
  my enum SOCK (
    STREAM => 1,
    DGRAM => 2,
    RAW => 3,
    RDM => 4,
    SEQPACKET => 5,
  );
  SOCK;
}
!! ($*KERNEL.name eq 'freebsd' ?? do {
  my enum SOCK (
    STREAM => 1,
    DGRAM => 2,
    RAW => 3,
    RDM => 4,
    SEQPACKET => 5,
  );
  SOCK;
}
!! ($*KERNEL.name eq 'openbsd' ?? do {
  my enum SOCK (
    STREAM => 1,
    DGRAM => 2,
    RAW => 3,
    RDM => 4,
    SEQPACKET => 5,
  );
  SOCK;
}
!! do { #macosx
  my enum SOCK (
    STREAM => 1,
    DGRAM => 2,
    RAW => 3,
    RDM => 4,
    SEQPACKET => 5,
  );
  SOCK;
}
)))));

constant SOL is export(:SOL) := $*KERNEL.name eq 'linux' ?? do {
  my enum SOL (
    SOCKET => 1,
  );
  SOL;
}
!! ($*KERNEL.name eq any('netbsd') ?? do {
  my enum SOL (
    SOCKET => 0xFFFF,
  );
  SOL;
}
!! ($*KERNEL.name eq any('dragonflybsd') ?? do {
  my enum SOL (
    SOCKET => 0xFFFF,
  );
  SOL;
}
!! ($*DISTRO.is-win() ?? do {
  my enum SOL (
    SOCKET => 0xFFFF,
  );
  SOL;
}
!! ($*KERNEL.name eq 'freebsd' ?? do {
  my enum SOL (
    SOCKET => 0xFFFF,
  );
  SOL;
}
!! ($*KERNEL.name eq 'openbsd' ?? do {
  my enum SOL (
    SOCKET => 0xFFFF,
  );
  SOL;
}
!! do { #macosx
  my enum SOL (
    SOCKET => 0xFFFF,
  );
  SOL;
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

constant MSG is export(:MSG) := $*KERNEL.name eq 'linux' ?? do {
  my enum MSG (
    OOB => 0x01,
    PEEK => 0x02,
    DONTROUTE => 0x04,
    TRYHARD => 0x04,
    CTRUNC => 0x08,
    PROXY => 0x10,
    TRUNC => 0x20,
    DONTWAIT => 0x40,
    EOR => 0x80,
    WAITALL => 0x100,
    FIN => 0x200,
    SYN => 0x400,
    CONFIRM => 0x800,
    RST => 0x1_000,
    ERRQUEUE => 0x2_000,
    NOSIGNAL => 0x4_000,
    MORE => 0x8_000,
    WAITFORONE => 0x10_000,
    BATCH => 0x20_000,
    ZEROCOPY => 0x4_000_000,
    FASTOPEN => 0x20_000_000,
    CMSG_CLOEXEC => 0x40_000_000,
  );
  MSG;
}
!! ($*KERNEL.name eq any('netbsd') ?? do {
  my enum MSG (
    OOB => 0x01,
    PEEK => 0x02,
    DONTROUTE => 0x04,
    EOR => 0x08,
    TRUNC => 0x10,
    CTRUNC => 0x20,
    WAITALL => 0x40,
    DONTWAIT => 0x80,
    BCAST => 0x100,
    MCAST => 0x200,
    NOSIGNAL => 0x400,
    CMSG_CLOEXEC => 0x800,
    NBIO => 0x1_000,
    WAITFORONE => 0x2_000,
    NOTIFICATION => 0x4_000,
  );
  MSG;
}
!! ($*KERNEL.name eq any('dragonflybsd') ?? do {
  my enum MSG (
    OOB => 0x01,
    PEEK => 0x02,
    DONTROUTE => 0x04,
    EOR => 0x08,
    TRUNC => 0x10,
    CTRUNC => 0x20,
    WAITALL => 0x40,
    DONTWAIT => 0x80,
    EOF => 0x100,
    NOSIGNAL => 0x400,
    SYNC => 0x800,
    CMSG_CLOEXEC => 0x1_000,
    FBLOCKING => 0x10_000,
    FNONBLOCKING => 0x20_000,
    FMASK => 0xFFFF0000,
  );
  MSG;
}
!! ($*DISTRO.is-win() ?? do {
  my enum MSG (
    OOB => 0x1,
    PEEK => 0x2,
    DONTROUTE => 0x4,
    PARTIAL => 0x8000,
    INTERRUPT => 0x10,
    MAXIOVLEN => 16,
  );
  MSG;
}
!! ($*KERNEL.name eq 'freebsd' ?? do {
  my enum MSG (
    OOB => 0x1,
    PEEK => 0x2,
    DONTROUTE => 0x4,
    EOR => 0x8,
    TRUNC => 0x10,
    CTRUNC => 0x20,
    WAITALL => 0x40,
    DONTWAIT => 0x80,
    EOF => 0x100,
    NOTIFICATION => 0x2_000,
    NBIO => 0x4_000,
    COMPAT => 0x8_000,
    SOCALLBCK => 0x10_000,
    NOSIGNAL => 0x20_000,
    CMSG_CLOEXEC => 0x40_000,
    WAITFORONE => 0x80_000,
    MORETOCOME => 0x100_000,
  );
  MSG;
}
!! ($*KERNEL.name eq 'openbsd' ?? do {
  my enum MSG (
    OOB => 0x1,
    PEEK => 0x2,
    DONTROUTE => 0x4,
    EOR => 0x8,
    TRUNC => 0x10,
    CTRUNC => 0x20,
    WAITALL => 0x40,
    DONTWAIT => 0x80,
    BCAST => 0x100,
    MCAST => 0x200,
    NOSIGNAL => 0x400,
    CMSG_CLOEXEC => 0x800
  );
  MSG;
}
!! do { #macosx
  my enum MSG (
    OOB => 0x1,
    PEEK => 0x2,
    DONTROUTE => 0x4,
    EOR => 0x8,
    TRUNC => 0x10,
    CTRUNC => 0x20,
    WAITALL => 0x40,
    DONTWAIT => 0x80,
    EOF => 0x100,
    WAITSTREAM => 0x200,
    FLUSH => 0x400,
    HOLD => 0x800,
    SEND => 0x1_000,
    HAVEMORE => 0x2_000,
    RCVMORE => 0x4_000,
    NEEDSA => 0x10_000,
  );
  MSG;
}
)))));
