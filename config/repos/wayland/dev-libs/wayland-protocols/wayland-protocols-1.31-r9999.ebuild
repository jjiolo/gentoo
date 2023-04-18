#############
EAPI=8
#############
DESCRIPTION="Wayland protocol files"
HOMEPAGE="https://wayland.freedesktop.org/"
SRC_URI="https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="dev-libs/wayland"
#############
src_configure(){
meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Ddebug=false \
-Ddefault_library=both \
-Dprefer_static=false \
-Dwerror=true \
\
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \
\
-Db_tests=false
}
#############
src_compile(){ ninja -C build -j16 -l16 || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############
