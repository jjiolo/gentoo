#############
EAPI=8
#############
DESCRIPTION="Graphical IRC client based on XChat"
HOMEPAGE="https://hexchat.github.io/"
SRC_URI="https://dl.hexchat.net/hexchat/hexchat-2.16.1.tar.xz"
#############
KEYWORDS="amd64"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
RDEPEND="
app-accessibility/at-spi2-core
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/libffi
dev-libs/libpcre2
dev-libs/openssl
media-libs/fontconfig
media-libs/freetype
media-libs/harfbuzz
media-libs/libpng
sys-libs/glibc
sys-libs/zlib
x11-libs/cairo
x11-libs/gdk-pixbuf
<x11-libs/gtk+-3
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
x11-libs/libxcb
x11-libs/pango
x11-libs/pixman
"
DEPEND="${RDEPEND}"
#############
src_configure(){
meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Dgtk-frontend=true \
-Dtext-frontend=false \
-Dtheme-manager=false \
-Dtls=enabled \
-Dplugin=false \
-Ddbus=disabled \
-Dlibcanberra=disabled \
-Ddbus-service-use-appid=false \
-Dinstall-appdata=false \
-Dinstall-plugin-metainfo=false \
-Dwith-checksum=false \
-Dwith-exec=false \
-Dwith-fishlim=false \
-Dwith-lua=false \
-Dwith-perl=false \
-Dwith-python=false \
-Dwith-sysinfo=false \
-Dwith-upd=false \
-Dwith-winamp=false \
-Dwith-perl-legacy-api=false
}
#############
src_compile(){ ninja -C build -j$(nproc) -l$(nproc) ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "build/src/fe-gtk/hexchat" "${D}/usr/bin" || die "install failed"
ln -s "/usr/bin/ircd" "${D}/usr/bin/hexchat"
}
#############

