#############
EAPI=8
#############
DESCRIPTION="desktop notifications without dbus"
HOMEPAGE="https://github.com/dudik/herbe"
SRC_URI="https://github.com/dudik/herbe/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT"
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
x11-libs/libXft
x11-libs/libXrender
x11-libs/libxcb
"
DEPEND="${RDEPEND}"
#############
src_configure(){ cp -a "${FILESDIR}/config.h" "${S}/config.h" ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "herbe" "${D}/usr/bin" || die "install failed"
}
#############
