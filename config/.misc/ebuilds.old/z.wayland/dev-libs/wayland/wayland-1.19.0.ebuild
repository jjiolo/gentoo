#############
EAPI=7
#############
DESCRIPTION="Wayland protocol libraries"
HOMEPAGE="https://wayland.freedesktop.org/ https://gitlab.freedesktop.org/wayland/wayland"
SRC_URI="https://wayland.freedesktop.org/releases/${P}.tar.xz"
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
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \
\
-Ddocumentation=false \
-Ddtd_validation=false \
-Dicon_directory=${datadir}/icons \
-Dlibraries=true \
-Dscanner=true
}
#############
src_compile(){ ninja -C build -j16 -l16 ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install ; }
#############
