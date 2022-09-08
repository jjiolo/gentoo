#############
EAPI=7
#############
DESCRIPTION="Userland client/server for kernel network block device"
HOMEPAGE="http://nbd.sourceforge.io"
SRC_URI="https://download.sourceforge.net/nbd/${P}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/glib
dev-libs/libpcre
sys-libs/glibc
"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--sysconfdir=/etc \
--enable-option-checking \
--enable-silent-rules \
--disable-maintainer-mode \
--disable-shared \
--enable-static \
--disable-fast-install \
--disable-dependency-tracking \
--enable-libtool-lock \
--enable-lfs \
--enable-syslog \
--disable-debug \
--disable-sdp \
--disable-gznbd \
--disable-manpages \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-gnutls \
--without-libnl
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 "nbd-client" "${D}/sbin"
install    -o root -g root -m 0755 "nbd-server" "${D}/bin"
}
#############

