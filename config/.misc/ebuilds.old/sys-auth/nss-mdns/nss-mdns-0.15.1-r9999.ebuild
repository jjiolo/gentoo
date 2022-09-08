#############
EAPI=7
#############
DESCRIPTION="Name Service Switch module for Multicast DNS"
HOMEPAGE="https://github.com/lathiat/nss-mdns"
SRC_URI="https://github.com/lathiat/nss-mdns/releases/download/v${PV}/${P}.tar.gz"
#############
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){

./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--disable-tests \
--enable-static \
--enable-shared \
--disable-fast-install \
--enable-libtool-lock \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot

}
#############
src_install(){ default ; }
#############
