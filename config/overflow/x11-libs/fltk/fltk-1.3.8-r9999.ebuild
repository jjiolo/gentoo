#############
EAPI=8
#############
DESCRIPTION="C++ user interface toolkit for X and OpenGL"
HOMEPAGE="https://www.fltk.org/"
SRC_URI="https://www.fltk.org/pub/${PN}/${PV}/${P}-source.tar.gz"
#############
LICENSE="FLTK LGPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/libbsd
media-libs/libjpeg-turbo
media-libs/libpng
sys-libs/glibc
sys-libs/zlib
x11-libs/libX11
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libxcb
"
DEPEND="${RDEPEND}"
#############
src_configure(){
# --with-optim="" \
# --with-archflags="" \
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--disable-cygwin \
--enable-x11 \
--disable-cairoext \
--disable-cairo \
--disable-debug \
--disable-cp936 \
--disable-gl \
--enable-shared \
--disable-threads \
--enable-largefile \
--disable-localjpeg \
--disable-localzlib \
--disable-localpng \
--disable-xinerama \
--disable-xft \
--disable-xdbe \
--disable-xfixes \
--disable-xcursor \
--disable-xrender \
\
--without-abiversion \
--without-links \
--with-x
}
#############
src_install(){ default ; mv "${D}/usr/lib" "${D}/usr/lib64" ; }
#############

