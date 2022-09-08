#############
EAPI=7
#############
DESCRIPTION="A utility for network discovery and security auditing"
HOMEPAGE="https://nmap.org/"
SRC_URI="https://nmap.org/dist/${P}.tar.bz2"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="
${RDEPEND}
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
#############
src_configure(){
#--with-libnbase # any reference breaks compile
#--with-libnsock # any reference breaks compile
LDFLAGS=-static ./configure \
--prefix=/usr \
--enable-option-checking \
--disable-nls \
\
--without-localdirs \
--without-ndiff \
--without-zenmap \
--without-nping \
--without-openssl \
--with-libpcap=included \
--with-libpcre=included \
--with-libz \
--without-libssh2 \
--with-libdnet=included \
--without-liblua \
--with-liblinear=included \
\
\
--without-ncat
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin"
install    -o root -g root -m 0755 "nmap" "${D}/bin"
}
#############
