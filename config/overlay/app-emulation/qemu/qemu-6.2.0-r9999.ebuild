#############
EAPI="7"
#############
DESCRIPTION="QEMU + Kernel-based Virtual Machine userland tools"
HOMEPAGE="http://www.qemu.org http://www.linux-kvm.org"
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
dev-libs/libpcre[static-libs]
dev-libs/libusb[static-libs]
media-libs/libjpeg-turbo[static-libs]
media-libs/libpng[static-libs]
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
--enable-sanitizers \
--disable-tsan \
--enable-stack-protector \
--audio-drv-list= \
--block-drv-rw-whitelist=file,raw \
--block-drv-ro-whitelist=file,raw \
--enable-block-drv-whitelist-in-tools \
--disable-plugins \
--enable-capstone=disabled \
--disable-cfi \
--disable-cfi-debug \
--enable-fdt=internal \
--enable-malloc=system \
--enable-slirp=internal \
\
--disable-alsa \
--disable-attr \
--disable-auth-pam \
--disable-bpf \
--disable-brlapi \
--disable-bzip2 \
--disable-cap-ng \
--disable-cocoa \
--disable-coreaudio \
--disable-curl \
--disable-curses \
--disable-docs \
--disable-dsound \
--disable-fuse \
--disable-fuse-lseek \
--disable-gcrypt \
--disable-gettext \
--disable-glusterfs \
--disable-gnutls \
--disable-gtk \
--disable-guest-agent-msi \
--disable-hax \
--disable-hvf \
--disable-iconv \
--disable-jack \
--enable-kvm \
--disable-l2tpv3 \
--disable-libdaxctl \
--disable-libiscsi \
--disable-libnfs \
--disable-libpmem \
--disable-libudev \
--enable-libusb \
--disable-libxml2 \
--disable-linux-aio \
--disable-linux-io-uring \
--disable-lzfse \
--disable-lzo \
--disable-malloc-trim \
--disable-mpath \
--disable-multiprocess \
--disable-netmap \
--disable-nettle \
--disable-nvmm \
--disable-oss \
--disable-pa \
--disable-rbd \
--disable-sdl \
--disable-sdl-image \
--enable-seccomp \
--disable-selinux \
--disable-smartcard \
--disable-snappy \
--disable-sparse \
--disable-spice \
--disable-spice-protocol \
--disable-tcg \
--disable-u2f \
--disable-usb-redir \
--disable-vde \
--disable-vhost-user-blk-server \
--disable-virglrenderer \
--disable-virtfs \
--disable-virtiofsd \
--enable-vnc \
--enable-vnc-jpeg \
--enable-vnc-png \
--disable-vnc-sasl \
--disable-vte \
--disable-whpx \
--disable-xen \
--disable-xen-pci-passthrough \
--disable-xkbcommon \
--disable-zstd \
--enable-system \
--disable-user \
--disable-linux-user \
--disable-bsd-user \
--disable-guest-agent \
--enable-pie \
--disable-modules \
--disable-module-upgrades \
--disable-debug-tcg \
--disable-debug-info \
--enable-lto \
--disable-safe-stack \
--disable-membarrier \
--disable-rdma \
--disable-pvrdma \
--disable-vhost-net \
--disable-vhost-vsock \
--disable-vhost-scsi \
--disable-vhost-crypto \
--disable-vhost-kernel \
--disable-vhost-user \
--disable-vhost-vdpa \
--disable-live-block-migration \
--disable-coroutine-pool \
--disable-tpm \
--disable-libssh \
--disable-numa \
--disable-avx2 \
--disable-avx512f \
--disable-replication \
--disable-opengl \
--disable-xfsctl \
--disable-qom-cast-debug \
--enable-tools \
--disable-bochs \
--disable-cloop \
--disable-dmg \
--disable-qcow1 \
--disable-vdi \
--disable-vvfat \
--disable-qed \
--disable-parallels \
--disable-crypto-afalg \
--disable-debug-mutex \
--disable-rng-none \
--disable-gio \
--disable-slirp-smbd

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
