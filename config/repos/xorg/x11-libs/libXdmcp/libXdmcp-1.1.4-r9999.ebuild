#############
EAPI=8
#############
DESCRIPTION="X.Org X Display Manager Control Protocol library"
HOMEPAGE="https://www.x.org"
SRC_URI="https://www.x.org/releases/individual/lib/${P}.tar.xz"
#############
LICENSE="Other"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-libs/glibc
"
DEPEND="
x11-base/xorg-proto
${RDEPEND}
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
--disable-docs \
--disable-lint-library \
--disable-unit-tests \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-xmlto \
--without-fop \
--without-xsltproc \
--without-lint
}
#############
src_install(){ default ; }
#############

