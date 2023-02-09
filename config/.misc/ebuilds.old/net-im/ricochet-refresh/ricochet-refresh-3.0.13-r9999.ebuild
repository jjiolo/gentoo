#############
EAPI="8"
#############
DESCRIPTION="teh bestest chat messages"
HOMEPAGE="https://www.ricochetrefresh.net"
SRC_URI="https://github.com/blueprint-freespeech/${PN}/releases/download/v${PV}-release/${P}-linux-x86_64.tar.gz -> ${P}.tar.gz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/expat
dev-libs/libbsd
media-libs/fontconfig
media-libs/freetype
media-libs/libpng
sys-libs/glibc
sys-libs/zlib
x11-libs/libX11
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libxcb
x11-libs/libxkbcommon[X]
x11-libs/xcb-util
x11-libs/xcb-util-image
x11-libs/xcb-util-keysyms
x11-libs/xcb-util-renderutil
x11-libs/xcb-util-wm
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${PN}"
#############
src_install(){
 install -d -o root -g root -m 0755 "${D}/sbin"
 install -o root -g root -m 0755 "ricochet-refresh" "${D}/sbin"
}
#############
