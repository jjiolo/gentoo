#############
EAPI=7
#############
DESCRIPTION="i3-compatible Wayland window manager"
HOMEPAGE="https://swaywm.org"
SRC_URI="https://github.com/swaywm/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/json-c
dev-libs/libbsd
dev-libs/libevdev
dev-libs/libffi
dev-libs/libinput
dev-libs/libpcre
dev-libs/wayland
gui-libs/wlroots
media-libs/fontconfig
media-libs/freetype
media-libs/harfbuzz
media-libs/libglvnd
media-libs/libpng
media-libs/mesa
sys-auth/seatd
sys-fs/eudev
sys-libs/glibc
sys-libs/mtdev
sys-libs/zlib
x11-libs/cairo
x11-libs/libX11
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libXrender
x11-libs/libdrm
x11-libs/libxcb
x11-libs/libxkbcommon
x11-libs/pango
x11-libs/pixman
x11-libs/xcb-util-wm
"
DEPEND="${RDEPEND}"
#############
src_configure(){
meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Ddebug=false \
-Ddefault_library=both \
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \
\
-Dbash-completions=false \
-Ddefault-wallpaper=false \
-Dfish-completions=false \
-Dgdk-pixbuf=disabled \
-Dman-pages=disabled \
-Dsd-bus-provider=auto \
-Dtray=disabled \
-Dzsh-completions=false
}
#############
src_compile(){ ninja -C build -j16 -l16 ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install ; }
#############
