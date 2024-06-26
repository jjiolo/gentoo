#############
EAPI=8
#############
DESCRIPTION="Gimp ToolKit +"
HOMEPAGE="https://www.gtk.org/"
SRC_URI="https://download.gnome.org/sources/gtk+/3.24/${P}.tar.xz"
#############
LICENSE="LGPL-2+"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="
app-accessibility/at-spi2-core
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/libffi
dev-libs/libpcre2
media-libs/fontconfig
media-libs/freetype
media-libs/harfbuzz
media-libs/libepoxy
media-libs/libpng
sys-apps/dbus
sys-libs/glibc
sys-libs/zlib
x11-libs/cairo
x11-libs/gdk-pixbuf
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
DEPEND="${RDEPEND} dev-util/gdbus-codegen"
#############
src_configure(){

meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Ddebug=false \
-Ddefault_library=both \
-Dprefer_static=false \
-Dwerror=false \
\
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \
\
-Dx11_backend=true \
-Dwayland_backend=false \
-Dbroadway_backend=false \
-Dwin32_backend=false \
-Dquartz_backend=false \
-Dxinerama=no \
-Dcloudproviders=false \
-Dprofiler=false \
-Dtracker3=false \
-Dprint_backends='file' \
-Dcolord=no \
-Dgtk_doc=false \
-Dman=false \
-Dintrospection=false \
-Ddemos=false \
-Dexamples=false \
-Dtests=false \
-Dinstalled_tests=false \
-Dbuiltin_immodules=none

}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############

