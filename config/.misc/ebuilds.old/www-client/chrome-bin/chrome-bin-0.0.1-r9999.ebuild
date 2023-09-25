#############
EAPI="7"
#############
DESCRIPTION="chromium-bin fairly sure its google chrome"
HOMEPAGE="https://chromium.org"
SRC_URI="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-accessibility/at-spi2-atk
app-accessibility/at-spi2-core
app-crypt/libmd
dev-libs/atk
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/libbsd
dev-libs/libffi
dev-libs/libpcre
media-libs/alsa-lib
media-libs/fontconfig
media-libs/freetype
media-libs/harfbuzz
media-libs/libpng
sys-apps/dbus
sys-libs/glibc
sys-libs/zlib
x11-libs/cairo
x11-libs/libX11
x11-libs/libXau
x11-libs/libXcomposite
x11-libs/libXdamage
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libdrm
x11-libs/libxcb
x11-libs/libxshmfence
x11-libs/pango
x11-libs/pixman
dev-libs/nss
dev-libs/nspr
x11-libs/libxkbcommon
"
DEPEND="${RDEPEND}"
S="${WORKDIR}"
#############
src_configure(){ default ; }
#############
src_install(){

 install -d -o 0 -g 0 -m 0755 "${D}/usr" "${D}/usr/lib64"

 tar xf data.tar.xz
 
 cp -a "opt/google/chrome" "${D}/usr/lib64/chrome-bin"

 cp -a "usr/share/" "${D}/usr"

# install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
# ln -s /usr/lib64/chrome-bin/ "${D}/usr/bin/chrome"

}
#############
#libsmime3.so => not found
#libcups.so.2 => not found
#libgbm.so.1 => not found
#############

