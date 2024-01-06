
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
    wifi - /tmp/storage/.wifi
   audio - /dev/snd
   video - /dev/video*
 desktop - /dev/input /dev/dri
  window - nothing ?
    qemu - /dev/kvm

[network] - (renice -5) (/etc/network)
-------------
  ddns - 53,9050
  dnsd - 53
 dhcpd - 67
 dhcpc - 68
 tftpd - 69
  ntpd - 123

[services] - (renice +5) (/etc/services)
-------------
 crond -
  ircd - 6667
  sshd - 22
 maild - 25
 httpd - 80
  p2pd - 9091
  gitd - 9418
  sets -

[programs] - (renice +10) (/tmp/storage/home) (dtach/xephyr+firewall)
-------------
  irc - 6697
  ssh - 22
 mail - 465,995
 http - 443
  p2p - 6771
  git - 8149

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
  dnsd -
  ircd -
  sshd -
 maild -
 httpd -
  p2pd -
  gitd -
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

