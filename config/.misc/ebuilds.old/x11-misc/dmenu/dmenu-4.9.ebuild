#############
EAPI=7
#############
DESCRIPTION="a generic, highly customizable, and efficient menu for the X Window System"
HOMEPAGE="https://tools.suckless.org/dmenu/"
SRC_URI="https://dl.suckless.org/tools/${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/libbsd
media-libs/fontconfig
media-libs/freetype
sys-libs/glibc
sys-libs/zlib
x11-libs/libX11
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libXft
x11-libs/libXinerama
x11-libs/libXrender
x11-libs/libxcb
" # sys-apps/util-linux
DEPEND="${RDEPEND}"
#############
src_configure(){ cp -a "${FILESDIR}/config.h" "${S}"; }
#############
src_install(){
strip -s dmenu
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "dmenu" "${D}/usr/bin"
install    -o root -g root -m 0755 "${FILESDIR}/dmenu_run" "${D}/usr/bin"
}
#############
