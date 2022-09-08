#############
EAPI=7
#############
DESCRIPTION="TLS/SSL - Port Wrapper"
HOMEPAGE="https://www.stunnel.org"
SRC_URI="https://www.stunnel.org/downloads/${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${DEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-static \
--enable-shared \
--disable-fast-install \
--enable-libtool-lock \
--enable-largefile \
--enable-ipv6 \
--disable-fips \
--disable-systemd \
--disable-libwrap \
\
--with-threads=pthread \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-egd-socket \
--with-random=/dev/urandom
#--with-ssl
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "src/stunnel" "${D}/sbin"
}
#############
