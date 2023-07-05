#############
EAPI=8
#############
DESCRIPTION="X C-language Bindings sample implementations"
HOMEPAGE="https://xcb.freedesktop.org"
SRC_URI="https://xcb.freedesktop.org/dist/${P}.tar.xz"
#############
LICENSE="X11 License Distribution Modification Variant"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-libs/glibc
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libxcb
x11-libs/xcb-util
"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--disable-dependency-tracking \
--enable-libtool-lock \
--enable-selective-werror \
--disable-strict-compilation \
--disable-devel-docs \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-doxygen
}
#############
src_install(){ default ; }
#############

