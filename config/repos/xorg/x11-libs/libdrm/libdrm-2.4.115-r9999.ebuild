#############
EAPI=8
#############
DESCRIPTION="X.Org libdrm library"
HOMEPAGE="https://dri.freedesktop.org"
SRC_URI="https://dri.freedesktop.org/libdrm/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-libs/glibc
"
DEPEND="${RDEPEND}"
#############
src_configure(){
meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Ddebug=false \
-Ddefault_library=both \
-Dprefer_static=true \
-Dwerror=false \
\
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \
\
-Damdgpu=disabled \
-Dcairo-tests=disabled \
-Detnaviv=disabled \
-Dexynos=disabled \
-Dfreedreno=disabled \
-Dfreedreno-kgsl=false \
-Dinstall-test-programs=false \
-Dintel=disabled \
-Dman-pages=disabled \
-Dnouveau=disabled \
-Domap=disabled \
-Dradeon=disabled \
-Dtegra=disabled \
-Dtests=false \
-Dudev=false \
-Dvalgrind=disabled \
-Dvc4=disabled \
-Dvmwgfx=disabled
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############
