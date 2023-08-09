#############
EAPI=8
#############
DESCRIPTION="Wayland protocol libraries"
HOMEPAGE="https://wayland.freedesktop.org"
SRC_URI="https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/libffi
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
-Ddocumentation=false \
-Ddtd_validation=false \
-Dicon_directory=/usr/share/icons \
-Dlibraries=true \
-Dscanner=true \
-Dtests=false
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############
