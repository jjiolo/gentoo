#############
EAPI=8
#############
DESCRIPTION="Remote desktop viewer display system"
HOMEPAGE="https://www.tigervnc.org"
SRC_URI="https://github.com/TigerVNC/tigervnc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
media-libs/libjpeg-turbo
media-libs/libpng
sys-libs/glibc
sys-libs/zlib
x11-libs/fltk
x11-libs/libX11
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libXi
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libxcb
x11-libs/pixman
"
RDEPEND="${RDEPEND}
dev-libs/expat
media-libs/fontconfig
media-libs/freetype
sys-libs/pam
x11-libs/libICE
x11-libs/libSM
x11-libs/libXcursor
x11-libs/libXdamage
x11-libs/libXfixes
x11-libs/libXft
x11-libs/libXinerama
x11-libs/libXtst
"
DEPEND="${RDEPEND}"
#############
src_configure(){

mkdir build

cd build

cmake \
-DBUILD_JAVA=OFF \
-DBUILD_STATIC=OFF \
-DBUILD_STATIC_GCC=OFF \
-DBUILD_VIEWER=ON \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DENABLE_ASAN=OFF \
-DENABLE_GNUTLS=OFF \
-DENABLE_H264=OFF \
-DENABLE_NETTLE=OFF \
-DENABLE_NLS=OFF \
-DENABLE_TSAN=OFF \
-DINSTALL_SYSTEMD_UNITS=OFF ..
}
#############
src_compile(){ cd build ; default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 build/vncviewer/vncviewer "${D}/usr/bin" || die "install failed"
}
#############
