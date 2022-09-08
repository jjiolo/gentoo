#!/bin/sh
############# -t filter -t nat -t mangle -t raw -t security
iptables -F
iptables -X
iptables -t filter -F
iptables -t filter -X

#############
iptables -P OUTPUT  DROP
iptables -P INPUT   DROP
iptables -P FORWARD DROP

#############
iptables -N ILUDP
iptables -N ILTCP
iptables -N OLUDP
iptables -N OLTCP
iptables -N IAUDP
iptables -N IATCP
iptables -N OAUDP
iptables -N OATCP

#############
iptables -A INPUT                                 -p icmp -j DROP
iptables -A INPUT -i lo -s 127.0.0.1 -d 127.0.0.1 -p udp  -j ILUDP
iptables -A INPUT -i lo -s 127.0.0.1 -d 127.0.0.1 -p tcp  -j ILTCP
iptables -A INPUT                                 -p udp  -j IAUDP
iptables -A INPUT                                 -p tcp  -j IATCP
iptables -A INPUT                                         -j LOG --log-level 7 --log-prefix 'drop.input: '

#############
iptables -A OUTPUT                                 -p icmp -j DROP
iptables -A OUTPUT -o lo -s 127.0.0.1 -d 127.0.0.1 -p tcp  -j OLTCP
iptables -A OUTPUT -o lo -s 127.0.0.1 -d 127.0.0.1 -p udp  -j OLUDP
iptables -A OUTPUT                                 -p tcp  -j OATCP
iptables -A OUTPUT                                 -p udp  -j OAUDP
iptables -A OUTPUT                                         -j LOG --log-level 7 --log-prefix 'drop.output: '

############# # lo

############# input lo udp
 iptables -A ILUDP -m conntrack --ctproto udp --ctstate INVALID         -j LOG --log-level 7 --log-prefix 'input.lo.udp.invalid: '
 iptables -A ILUDP -m conntrack --ctproto udp --ctstate INVALID         -j DROP
 iptables -A ILUDP -m conntrack --ctproto udp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'input.lo.udp.new: '
 iptables -A ILUDP -m conntrack --ctproto udp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A ILUDP                                                      -j LOG --log-level 7 --log-prefix 'input.lo.udp.drop: '
 iptables -A ILUDP                                                      -j DROP

############# input lo tcp
 iptables -A ILTCP -m conntrack --ctproto tcp --ctstate INVALID         -j LOG --log-level 7 --log-prefix 'input.lo.tcp.invalid: '
 iptables -A ILTCP -m conntrack --ctproto tcp --ctstate INVALID         -j DROP
 iptables -A ILTCP -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'input.lo.tcp.new: '
 iptables -A ILTCP -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A ILTCP                                                      -j LOG --log-level 7 --log-prefix 'input.lo.tcp.drop: '
 iptables -A ILTCP                                                      -j DROP

############# output lo udp
 iptables -A OLUDP -m conntrack --ctproto udp --ctstate INVALID         -j LOG --log-level 7 --log-prefix 'output.lo.udp.invalid: ' --log-uid
 iptables -A OLUDP -m conntrack --ctproto udp --ctstate INVALID         -j DROP
 iptables -A OLUDP -m conntrack --ctproto udp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.lo.udp.new: ' --log-uid
 iptables -A OLUDP -m conntrack --ctproto udp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OLUDP                                                      -j LOG --log-level 7 --log-prefix 'output.lo.udp.drop: ' --log-uid
 iptables -A OLUDP                                                      -j DROP

############# output lo tcp
 iptables -A OLTCP -m conntrack --ctproto tcp --ctstate INVALID         -j LOG --log-level 7 --log-prefix 'output.lo.tcp.invalid: ' --log-uid
 iptables -A OLTCP -m conntrack --ctproto tcp --ctstate INVALID         -j DROP
 iptables -A OLTCP -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.lo.tcp.new: ' --log-uid
 iptables -A OLTCP -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OLTCP                                                      -j LOG --log-level 7 --log-prefix 'output.lo.tcp.drop: ' --log-uid
 iptables -A OLTCP                                                      -j DROP

############# # any

############# input any udp
 iptables -A IAUDP                      -m conntrack --ctproto udp --ctstate INVALID     -j LOG --log-level 7 --log-prefix 'input.any.udp.invalid: '
 iptables -A IAUDP                      -m conntrack --ctproto udp --ctstate INVALID     -j DROP
 iptables -A IAUDP -p udp --sport 53    -m conntrack --ctproto udp --ctstate ESTABLISHED -j ACCEPT
 iptables -A IAUDP -p udp --sport 123   -m conntrack --ctproto udp --ctstate ESTABLISHED -j ACCEPT
 iptables -A IAUDP                                                                       -j LOG --log-level 7 --log-prefix 'input.any.udp.drop: '
 iptables -A IAUDP                                                                       -j DROP

############# input any tcp
 iptables -A IATCP                      -m conntrack --ctproto tcp --ctstate INVALID         -j LOG --log-level 7 --log-prefix 'input.any.tcp.invalid: '
 iptables -A IATCP                      -m conntrack --ctproto tcp --ctstate INVALID         -j DROP
 iptables -A IATCP -p tcp --dport 6097  -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'input.any.tcp.new: '
 iptables -A IATCP -p tcp --dport 6097  -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A IATCP -p tcp --sport 80    -m conntrack --ctproto tcp --ctstate ESTABLISHED     -j ACCEPT
 iptables -A IATCP -p tcp --sport 443   -m conntrack --ctproto tcp --ctstate ESTABLISHED     -j ACCEPT
 iptables -A IATCP -p tcp --sport 873   -m conntrack --ctproto tcp --ctstate ESTABLISHED     -j ACCEPT
 iptables -A IATCP -p tcp --sport 6097  -m conntrack --ctproto tcp --ctstate ESTABLISHED     -j ACCEPT
 iptables -A IATCP -p tcp --sport 6697  -m conntrack --ctproto tcp --ctstate ESTABLISHED     -j ACCEPT
 iptables -A IATCP                                                                           -j LOG --log-level 7 --log-prefix 'input.any.tcp.drop: '
 iptables -A IATCP                                                                           -j DROP

############# output any udp
 iptables -A OAUDP                      -m conntrack --ctproto udp --ctstate INVALID         -j LOG --log-level 7 --log-prefix 'output.any.udp.invalid: ' --log-uid
 iptables -A OAUDP                      -m conntrack --ctproto udp --ctstate INVALID         -j DROP
 iptables -A OAUDP -p udp --dport 53    -m conntrack --ctproto udp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.any.udp.new: ' --log-uid
 iptables -A OAUDP -p udp --dport 53    -m conntrack --ctproto udp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OAUDP -p udp --dport 123   -m conntrack --ctproto udp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.any.udp.new: ' --log-uid
 iptables -A OAUDP -p udp --dport 123   -m conntrack --ctproto udp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OAUDP                                                                           -j LOG --log-level 7 --log-prefix 'output.any.udp.drop: ' --log-uid
 iptables -A OAUDP                                                                           -j DROP

############# output any tcp
 iptables -A OATCP                      -m conntrack --ctproto tcp --ctstate INVALID         -j LOG --log-level 7 --log-prefix 'output.any.tcp.invalid: ' --log-uid
 iptables -A OATCP                      -m conntrack --ctproto tcp --ctstate INVALID         -j DROP
 iptables -A OATCP -p tcp --dport 80    -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.any.tcp.new: ' --log-uid
 iptables -A OATCP -p tcp --dport 80    -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OATCP -p tcp --dport 443   -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.any.tcp.new: ' --log-uid
 iptables -A OATCP -p tcp --dport 443   -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OATCP -p tcp --dport 873   -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.any.tcp.new: ' --log-uid
 iptables -A OATCP -p tcp --dport 873   -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OATCP -p tcp --dport 6097  -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.any.tcp.new: ' --log-uid
 iptables -A OATCP -p tcp --dport 6097  -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OATCP -p tcp --dport 6697  -m conntrack --ctproto tcp --ctstate NEW             -j LOG --log-level 7 --log-prefix 'output.any.tcp.new: ' --log-uid
 iptables -A OATCP -p tcp --dport 6697  -m conntrack --ctproto tcp --ctstate NEW,ESTABLISHED -j ACCEPT
 iptables -A OATCP -p tcp --sport 6097  -m conntrack --ctproto tcp --ctstate ESTABLISHED     -j ACCEPT
 iptables -A OATCP                                                                           -j LOG --log-level 7 --log-prefix 'output.any.tcp.drop: ' --log-uid
 iptables -A OATCP                                                                           -j DROP

