#############
EAPI=8
#############
DESCRIPTION="X.Org fontenc library"
HOMEPAGE="https://www.x.org"
SRC_URI="https://x.org/releases/individual/lib/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-libs/glibc
sys-libs/zlib
"
DEPEND="
${RDEPEND}
x11-base/xorg-proto
"
#############
src_configure(){
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--disable-dependency-tracking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--enable-selective-werror \
--disable-strict-compilation \
--enable-largefile \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-fontrootdir \
--without-encodingsdir \
--without-lint
}
#############
src_install(){ default ; }
#############

