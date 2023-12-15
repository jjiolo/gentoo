
#############

[users] - (renice -10,+10) (/tmp/storage/home)
-------------
   root - console only
   user - dev mode (stage3 + sshd/nat/tun/ddnsd)
 nobody - single user mode + internet + proxy + audio/video
  proxy - single user mode + proxy
   jail - single user mode + audio/video

[hardware] - (renice +0) (/dev)
-------------
   audio - /dev/snd
   video - /dev/video*
 desktop - /dev/input /dev/dri
    wifi - /tmp/storage/.wifi
    qemu - /dev/kvm

[network] - (renice -5) (/etc/network)
-------------
  dnsd - 53
 dhcpd - 67/68
 tftpd - 69
  ntpd - 123

[services] - (renice +5) (/etc/services)
-------------
 crond -
  ddns - 53,9050
 httpd - 80
  ircd - 6667
 maild - 25
  p2pd - 9091
  sets -

[programs] - (renice +10) (/tmp/storage/home) (dtach/xephyr+firewall)
-------------
  ssh - 22
 http - 443
  irc - 6697
 mail - 465,995

#############

#############

[/etc/self]
-------------
  a.chroot - stage3 scripts
    b.init - host scripts
  c.server - gnupg/sshd/vpnd/wifi/xorg/xephyr
  d.client - http/irc/mail/p2p/media/log/qemu
 e.setpriv - network_{deamon,oneshot,ping,zcip}
 e.setpriv - udhcpd/tftpd/ntpd/ntpc
    f.sets - busybox_init,sets,{browser,certs,hosts}
 z.testing - misc

[/etc/services]
-------------
 crond - hour/day/week/month/year
  ddns - e2e hole punch
 httpd -
  ircd -
 maild -
  p2pd -
  sets -

[misc]
-------------
 tor - ed25519 hostname ?
 gpg - ed25519 fingerprint ?
 ssh - ed25519 fingerprint ?
 vpn - ed25519 fingerprint ?

#############

#############

[xorg]
-------------
 xinit/X/sleep
 dwm-host/st
 Xephyr/dwm-guest

#############

