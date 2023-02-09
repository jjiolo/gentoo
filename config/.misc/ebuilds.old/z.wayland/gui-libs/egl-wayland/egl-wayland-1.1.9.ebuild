#############
EAPI=8
#############
DESCRIPTION="EGLStream-based Wayland external platform"
HOMEPAGE="https://github.com/NVIDIA/egl-wayland"
SRC_URI="https://github.com/NVIDIA/egl-wayland/archive/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND=""
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
-Db_staticpic=true
}
#############
src_compile(){ ninja -C build -j16 -l16 ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install ; }
#############
