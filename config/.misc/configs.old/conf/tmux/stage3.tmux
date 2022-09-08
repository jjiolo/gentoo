
#############

 mountpoint -q "${stage3}" && exec tmux -S /run/stage3 new-session -c "${stage3}" -As stage3

#############

 [ -f "${mount}/stage3" ] || { qemu-img create -f raw "${mount}/stage3" 47G ; mkfs.ext4 -L "stage3" "${mount}/stage3" ; }

#############

 fsck.ext4 -pvf "${mount}/stage3"

 fsck.ext4 -pv "${mount}/stage3" &&
 install -d -o 0 -g 0 -m 0700 "${stage3}" &&
 mount -t ext4 -o rw,dev,nosuid,exec,noatime "${mount}/stage3" "${stage3}" &&
 install -d -o 0 -g 0 -m 0700 "${stage3}" || { umount "${stage3}" ; exit 1 ; }

#############

 exec tmux -S /run/stage3 new-session -c "${stage3}" -As stage3

#############

