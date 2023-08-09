#############
EAPI=8
#############
DESCRIPTION="Message Digest functions from BSD systems"
HOMEPAGE="https://www.hadrons.org/software/libmd"
SRC_URI="https://archive.hadrons.org/software/${PN}/${P}.tar.xz"
#############
LICENSE="|| ( BSD BSD-2 ISC BEER-WARE public-domain )"
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
--enable-largefile \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--disable-sanitize \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot
}
#############
src_install(){ default ; }
#############
