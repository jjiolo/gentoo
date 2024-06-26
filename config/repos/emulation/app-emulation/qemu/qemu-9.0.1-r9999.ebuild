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
${RDEPEND} dev-python/pip
dev-libs/glib[static-libs]
dev-libs/libpcre2[static-libs]
dev-libs/libusb[static-libs]
media-libs/libjpeg-turbo[static-libs]
sys-apps/dtc[static-libs]
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
\
--enable-lto \
--disable-cfi \
--disable-sanitizers \
--disable-tsan \
\
--audio-drv-list= \
--block-drv-ro-whitelist=file,raw \
--block-drv-rw-whitelist=file,raw \
--enable-block-drv-whitelist-in-tools \
\
--disable-containers \
--disable-relocatable \
\
--disable-coroutine-pool \
--disable-tcg-interpreter \
--disable-hexagon-idef-parser \
--disable-qom-cast-debug \
--enable-malloc=system \
--enable-fdt=system \
\
--disable-download \
\
--disable-af-xdp \
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
--disable-colo-proxy \
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
--disable-hv-balloon \
--disable-hvf \
--disable-iconv \
--disable-jack \
--disable-keyring \
--enable-kvm \
--disable-l2tpv3 \
--disable-libdaxctl \
--disable-libdw \
--disable-libiscsi \
--disable-libkeyutils \
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
--disable-modules \
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
--disable-pipewire \
--enable-pixman \
--disable-plugins \
--disable-png \
--disable-pvrdma \
--disable-qcow1 \
--disable-qed \
--disable-qga-vss \
--disable-rbd \
--disable-rdma \
--disable-replication \
--disable-rutabaga-gfx \
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
--enable-stack-protector \
--disable-tcg \
--enable-tools \
--disable-tpm \
--disable-u2f \
--disable-usb-redir \
--disable-vde \
--disable-vdi \
--disable-vduse-blk-export \
--disable-vfio-user-server \
--disable-vhdx \
--disable-vhost-crypto \
--disable-vhost-kernel \
--disable-vhost-net \
--disable-vhost-user \
--disable-vhost-user-blk-server \
--disable-vhost-vdpa \
--disable-virglrenderer \
--disable-virtfs \
--disable-virtfs-proxy-helper \
--disable-vmdk \
--disable-vmnet \
--enable-vnc \
--enable-vnc-jpeg \
--disable-vnc-sasl \
--disable-vpc \
--disable-vte \
--disable-vvfat \
--disable-werror \
--disable-whpx \
--disable-xen \
--disable-xen-pci-passthrough \
--disable-xkbcommon \
--disable-zstd \
--enable-system \
--disable-user \
--disable-linux-user \
--disable-bsd-user \
--enable-pie

}
#############
src_install(){
default ; rm -r "${D}/usr/bin" "${D}/usr/include" "${D}/usr/lib64" "${D}/usr/libexec" "${D}/usr/share/applications" "${D}/usr/share/icons"
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "build/qemu-img" "${D}/usr/bin" || die "install failed"
install    -o root -g root -m 0755 "build/qemu-system-x86_64" "${D}/usr/bin" || die "install failed"
}
#############
