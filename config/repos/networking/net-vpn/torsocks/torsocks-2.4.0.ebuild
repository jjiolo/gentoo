#############
EAPI=8
#############
DESCRIPTION="Use most socks-friendly applications with Tor"
HOMEPAGE="https://gitweb.torproject.org/torsocks.git"
SRC_URI="https://gitlab.torproject.org/tpo/core/torsocks/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${PN}-v${PV}"
#############
src_configure(){
autoreconf -i
sed -i '42 c\#define DEFAULT_CONF_FILE "/etc/torsocks"' src/common/defaults.h
sed -i '184c\ret = 0;' src/common/config-file.c # gcc 14
sed -i '102c\ret = 0;' src/lib/torsocks.c # gcc 14
./configure \
--prefix=/usr \
--sysconfdir=/etc \
--enable-option-checking \
--disable-dependency-tracking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
\
--with-conf=/etc/torsocks \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/lib64"
install    -o root -g root -m 0755 "src/lib/.libs/libtorsocks.so.0.0.0" "${D}/usr/lib64/libtorsocks.so" || die "install failed"
}
#############
