#############
EAPI=7
#############
DESCRIPTION="Transport Independent RPC library (SunRPC replacement)"
HOMEPAGE="https://sourceforge.net/projects/libtirpc/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.bz2"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--disable-gssapi \
--disable-authdes \
--enable-ipv6 \
--disable-symvers \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot
}
#############
src_install(){ default; }
#############
