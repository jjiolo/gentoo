#!/bin/sh
#############

ssh-keygen -t ed25519 -f /tmp/server -C "" -N ""
ephemeral="$(openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:secp384r1)"
secret="$(printf "%s" "${ephemeral}"|openssl pkeyutl -derive -inkey /dev/stdin -peerkey "${keyfs}/encrypt.pub"|openssl sha384|cut -d ' ' -f2)"
printf "%s" "${ephemeral}"|openssl ec -pubout -in /dev/stdin -out "${keyfs}/openssh/server.key"
openssl enc -e -base64 -salt -md sha512 -aes-256-cbc -iv "${secret:64:32}" -K "${secret:0:64}" -in /tmp/server -out "${keyfs}/openssh/server.enc"
printf "%s\n" "@cert-authority * $(ssh-keygen -yf /tmp/server)" > "${keyfs}/openssh/server.pub"
rm /tmp/server /tmp/server.pub

ssh-keygen -t ed25519 -f /tmp/client -C "" -N ""
ephemeral="$(openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:secp384r1)"
secret="$(printf "%s" "${ephemeral}"|openssl pkeyutl -derive -inkey /dev/stdin -peerkey "${keyfs}/encrypt.pub"|openssl sha384|cut -d ' ' -f2)"
printf "%s" "${ephemeral}"|openssl ec -pubout -in /dev/stdin -out "${keyfs}/openssh/client.key"
openssl enc -e -base64 -salt -md sha512 -aes-256-cbc -iv "${secret:64:32}" -K "${secret:0:64}" -in /tmp/client -out "${keyfs}/openssh/client.enc"
cp /tmp/client.pub "${keyfs}/openssh/client.pub"
rm /tmp/client /tmp/client.pub

#############

