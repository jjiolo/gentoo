#############
EAPI="7"
#############
DESCRIPTION="gafawwwwww"
HOMEPAGE="https://torproject.org"
SRC_URI="https://www.torproject.org/dist/torbrowser/${PV}/tor-browser-linux64-${PV}_en-US.tar.xz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-accessibility/at-spi2-atk
app-accessibility/at-spi2-core
dev-libs/atk
dev-libs/dbus-glib
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/libbsd
dev-libs/libffi
dev-libs/libpcre
media-libs/fontconfig
media-libs/freetype
media-libs/harfbuzz
media-libs/libepoxy
media-libs/libpng
media-sound/apulse
sys-apps/dbus
sys-libs/glibc
sys-libs/zlib
x11-libs/cairo
x11-libs/gdk-pixbuf
x11-libs/gtk+
x11-libs/libICE
x11-libs/libSM
x11-libs/libX11
x11-libs/libXau
x11-libs/libXcomposite
x11-libs/libXcursor
x11-libs/libXdamage
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXi
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libXt
x11-libs/libxcb
x11-libs/pango
x11-libs/pixman
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/tor-browser_en-US"
#############
src_install(){

 install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/lib64"
 mv Browser "${D}/usr/lib64/torbrowser" || die "install failed"

 install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
 ln -s /usr/lib64/torbrowser/firefox.real "${D}/usr/bin/torbrowser"

}
#############
