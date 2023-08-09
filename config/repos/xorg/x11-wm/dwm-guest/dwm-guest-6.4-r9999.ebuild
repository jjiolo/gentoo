#############
EAPI=8
#############
DESCRIPTION="a dynamic window manager for X11"
HOMEPAGE="https://dwm.suckless.org/"
SRC_URI="https://dl.suckless.org/${PN}/dwm-${PV}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
media-libs/fontconfig
media-libs/freetype
media-libs/libpng
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
media-fonts/liberation-fonts
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/dwm-${PV}"
#############
src_configure(){ cp -a "${FILESDIR}/config.h" "${S}/config.h" ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "dwm" "${D}/usr/bin/dwm-guest" || die "install failed"
}
#############
