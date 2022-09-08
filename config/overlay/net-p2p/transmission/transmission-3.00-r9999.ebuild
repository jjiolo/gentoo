#############
EAPI="7"
#############
DESCRIPTION="transmission bittorrent client"
HOMEPAGE="https://www.transmissionbt.com"
SRC_URI="https://github.com/transmission/transmission/releases/download/${PV}/${P}.tar.xz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libevent
dev-libs/openssl
net-libs/libnatpmp
net-libs/miniupnpc
net-misc/curl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--disable-dependency-tracking \
--enable-libtool-lock \
--enable-largefile \
--disable-external-dht \
--disable-external-b64 \
--enable-utp \
--enable-external-natpmp \
--disable-nls \
--disable-lightweight \
--enable-cli \
--disable-mac \
--enable-daemon \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--with-crypto=openssl \
--with-inotify \
--without-kqueue \
--without-systemd \
--without-gtk
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 "utils/transmission-create"  "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "utils/transmission-show"    "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "utils/transmission-edit"    "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "utils/transmission-remote"  "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "daemon/transmission-daemon" "${D}/sbin" || die "install failed"
ln -s "/sbin/transmission-daemon" "${D}/sbin/p2pd"
}
#############
