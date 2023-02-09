#############
EAPI=8
#############
DESCRIPTION="Pluggable, composable, unopinionated modules for building a Wayland compositor"
HOMEPAGE="https://github.com/swaywm/wlroots"
SRC_URI="https://github.com/swaywm/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0/14"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/wayland
dev-libs/wayland-protocols
x11-base/xwayland
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
-Dexamples=false \
-Dicon_directory=${datadir}/icons \
-Drenderers=gles2 \
-Dx11-backend=disabled \
-Dxcb-errors=disabled \
-Dxwayland=enabled
}
#############
src_compile(){ ninja -C build -j16 -l16 ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install ; }
#############
