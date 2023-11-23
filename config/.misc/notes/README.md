
#############

[services]
-------------
   root - console only
   user - dev mode (stage3 + dbclient/dnsd)
 nobody - single user mode no proxy + audio/video
  proxy - single user mode proxy only
   jail - no internet + audio/video
-------------
 nobody - 22,465,995,443,6697
    ssh - 22
   smtp - 465,995
   http - 443
    irc - 6697
-------------
/etc/services/
 crond
 ddns
 dnsd
 httpd
 p2pd
 sets
-------------
/etc/network/
 dhcpd
 dhcpc
 tftpd
  ntpd
-------------

-------------
* self contained virtual machine usb mic/webcam passthrough
-------------

 xinit
  X
  monitor

 dwm-host
  st

 Xephyr
  dwm-guest

ddns/dnsd
dhcpd/dhcpc
tftpd
ntpd
-------------
crond
smtpd
httpd
ircd
p2pd
sets


-------------
 ssh   - user,nobody,ssh
 smtp  - nobody,smtp
 http  - root,user,nobody,http
 p2p   - root,user,nobody
 irc   - nobody,irc
 qemu  - user,nobody,qemu
 media - nobody,jail
-------------
 a.chroot b.init (c.keys)
 c.server d.client
 e.setpriv
 f.sets
 z.testing
-------------
/etc/self/c.server
 gnupg g.{setup,conf,agent}
 dropbear s.{flush,client,server}
 wireguard v.{flush,client,server}
 wifi w.{scan,public,private,connect,auth}
 xephyr {x.nobody,x.proxy,x.jail}
 xephyr {p.ssh,p.smtp,p.http,p.irc,p.xmr}
-------------
per application file access
per application firewall access
all system binaries vs chroot ?
-------------
while sleep 3 ; do DISPLAY=:0 XAUTHORITY=/tmp/.X0-auth xrandr --auto ; done
-------------
lsw && xev -
 id="$(lsw|awk '/Xephyr.*:13/{print$1}')" ;
 xev -display :0 -id "${id}" -1 -event structure | 
 while read ; do DISPLAY=:13 XAUTHORITY=/tmp/.X13-auth xrandr ; done
-------------
^ polling Xephyr auto resize vs Xephyr triggering resize on events ?
-------------
#############

storage.bootfs -
$storage/{.gnupg,.ssh,.vpn,.wifi}
$services/ddns/{public,private}
$home/{user,nobody,proxy,jail,ssh,smtp,http,irc,xmr}/.ssh
$home/ssh/.ssh
$home/smtp/mail
$home/http/.browser
$home/irc/irc
$home/xmr/monero

 usb.persistence -
  storage.shared < - takes gnupg/public/private/sshd/user/nobody/proxy/vpn
  usb.get - get values saved in bootfs
  usb.put - put values into bootfs

 efi.persistence -
  storage.shared < - code duplication
  efi.get - get values saved in efi
  efi.put - put values into efi

^ would need encrypted usb...

-------------

 init: mount bootfs

  # install bootfs to host

  install -d $shared/downloads/bootfs
  cp bootx64.efi/client/{laptop,desktop,server,virtual}

  # install bootfs keys to host

  install -d $shared/contacts/$hostname
  cp gnupg/ssh/vpn/wifi ddns irc/mail/monero

  # install host keys to bootfs

  install -d $bootfs/contacts/$hostname
  cp gnupg/ssh/vpn/wifi ddns irc/mail/monero

-------------


