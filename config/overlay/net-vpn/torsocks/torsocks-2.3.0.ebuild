#############
EAPI=7
#############
DESCRIPTION="Use most socks-friendly applications with Tor"
HOMEPAGE="https://github.com/dgoulet/torsocks"
SRC_URI="https://github.com/dgoulet/torsocks/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){
autoreconf -i
sed -i '42 c\#define DEFAULT_CONF_FILE "/etc/torsocks"' src/common/defaults.h
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
