#############
EAPI=8
#############
DESCRIPTION="QEMU + Kernel-based Virtual Machine userland tools"
HOMEPAGE="https://www.qemu.org"
SRC_URI="https://download.qemu.org/${P}.tar.xz"
#############
LICENSE="GPL-2 LGPL-2 BSD-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="
${RDEPEND}
dev-libs/glib[static-libs]
dev-libs/libpcre2[static-libs]
dev-libs/libusb[static-libs]
media-libs/libjpeg-turbo[static-libs]
sys-libs/glibc[static-libs]
sys-libs/libseccomp[static-libs]
sys-libs/zlib[static-libs]
x11-libs/pixman[static-libs]
"
#############
src_configure(){

./configure --static \
--prefix=/usr \
--target-list=x86_64-softmmu \
--disable-werror \
--disable-tsan \
--disable-sanitizers \
--enable-stack-protector \
--audio-drv-list= \
--block-drv-ro-whitelist=file,raw \
--block-drv-rw-whitelist=file,raw \
--enable-block-drv-whitelist-in-tools \
--disable-plugins \
--enable-lto \
--disable-cfi \
--disable-coroutine-pool \
--disable-hexagon-idef-parser \
--disable-tcg-interpreter \
--enable-fdt=internal \
--enable-malloc=system \
\
--disable-alsa \
--disable-attr \
--disable-auth-pam \
--disable-avx2 \
--disable-avx512bw \
--disable-avx512f \
--disable-blkio \
--disable-bochs \
--disable-bpf \
--disable-brlapi \
--disable-bzip2 \
--disable-canokey \
--disable-cap-ng \
--disable-capstone \
--disable-cloop \
--disable-cocoa \
--disable-coreaudio \
--disable-crypto-afalg \
--disable-curl \
--disable-curses \
--disable-dbus-display \
--disable-dmg \
--disable-docs \
--disable-dsound \
--disable-fuse \
--disable-fuse-lseek \
--disable-gcrypt \
--disable-gettext \
--disable-gio \
--disable-glusterfs \
--disable-gnutls \
--disable-gtk \
--disable-gtk-clipboard \
--disable-guest-agent \
--disable-guest-agent-msi \
--disable-hax \
--disable-hvf \
--disable-iconv \
--disable-jack \
--disable-keyring \
--enable-kvm \
--disable-l2tpv3 \
--disable-libdaxctl \
--disable-libdw \
--disable-libiscsi \
--disable-libnfs \
--disable-libpmem \
--disable-libssh \
--disable-libudev \
--enable-libusb \
--disable-libvduse \
--disable-linux-aio \
--disable-linux-io-uring \
--disable-live-block-migration \
--disable-lzfse \
--disable-lzo \
--disable-malloc-trim \
--disable-membarrier \
--disable-mpath \
--disable-multiprocess \
--disable-netmap \
--disable-nettle \
--disable-numa \
--disable-nvmm \
--disable-opengl \
--disable-oss \
--disable-pa \
--disable-parallels \
--disable-png \
--disable-pvrdma \
--disable-qcow1 \
--disable-qed \
--disable-qga-vss \
--disable-rbd \
--disable-rdma \
--disable-replication \
--disable-sdl \
--disable-sdl-image \
--enable-seccomp \
--disable-selinux \
--disable-slirp \
--disable-slirp-smbd \
--disable-smartcard \
--disable-snappy \
--disable-sndio \
--disable-sparse \
--disable-spice \
--disable-spice-protocol \
--disable-tcg \
--enable-tools \
--disable-tpm \
--disable-u2f \
--disable-usb-redir \
--disable-vde \
--disable-vdi \
--disable-vduse-blk-export \
--disable-vfio-user-server \
--disable-vhost-crypto \
--disable-vhost-kernel \
--disable-vhost-net \
--disable-vhost-user \
--disable-vhost-user-blk-server \
--disable-vhost-vdpa \
--disable-virglrenderer \
--disable-virtfs \
--disable-vmnet \
--enable-vnc \
--enable-vnc-jpeg \
--disable-vnc-sasl \
--disable-vte \
--disable-vvfat \
--disable-whpx \
--disable-xen \
--disable-xen-pci-passthrough \
--disable-xkbcommon \
--disable-zstd \
--enable-system \
--disable-user \
--disable-linux-user \
--disable-bsd-user \
--enable-pie \
--disable-modules \
--disable-debug-tcg \
--disable-debug-info \
--disable-safe-stack

}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin" "${D}/usr/share" "${D}/usr/share/qemu" "${D}/usr/share/qemu/keymaps"
install    -o root -g root -m 0755 "build/qemu-img" "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "build/qemu-system-x86_64" "${D}/bin" || die "install failed"
cp -a pc-bios/*.rom pc-bios/*.bin pc-bios/*.dtb pc-bios/*.img "${D}/usr/share/qemu"
cp -a pc-bios/keymaps/en-gb "${D}/usr/share/qemu/keymaps"
}
#############
