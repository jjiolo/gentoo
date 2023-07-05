#############
EAPI=8
#############
DESCRIPTION="Library to provide useful functions commonly found on BSD systems"
HOMEPAGE="https://libbsd.freedesktop.org/wiki"
SRC_URI="https://libbsd.freedesktop.org/releases/${P}.tar.xz"
#############
LICENSE="BSD BSD-2 BSD-4 ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
sys-libs/glibc
"
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
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot
}
#############
src_install(){ default ; }
#############
