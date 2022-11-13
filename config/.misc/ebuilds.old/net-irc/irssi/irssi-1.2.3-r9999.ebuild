#############
EAPI=7
#############
DESCRIPTION="A modular textUI IRC client with IPv6 support"
HOMEPAGE="https://irssi.org/"
SRC_URI="https://github.com/${PN}/${PN}/releases/download/${PV}/${P}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/glib
dev-libs/libpcre
dev-libs/openssl
net-libs/libotr
sys-libs/glibc
sys-libs/ncurses
sys-libs/zlib
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
--disable-dependency-tracking \
--disable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--enable-largefile \
--disable-true-color \
--disable-gregex \
--disable-utf8proc \
--disable-glibtest \
--disable-installed-tests \
--disable-always-build-tests \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-socks \
--with-textui \
--without-bot \
--without-fuzzer \
--without-fuzzer-lib \
--without-proxy \
--without-modules \
--without-perl-staticlib \
--without-perl-lib \
--with-perl=no \
--with-otr=static \
--without-capsicum \
--without-libgcrypt-prefix \
--without-libotr-prefix \
--without-libotr-inc-prefix
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin" "${D}/usr" "${D}/usr/share" "${D}/usr/share/irssi" "${D}/usr/share/irssi/help"
install    -o root -g root -m 0755 "src/fe-text/irssi" "${D}/bin"
rm -rf docs/help/in docs/help/Make*
cp -a docs/help "${D}/usr/share/irssi/help"
}
#############
