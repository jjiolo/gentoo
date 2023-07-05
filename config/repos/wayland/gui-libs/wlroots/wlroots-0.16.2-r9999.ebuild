#############
EAPI=8
#############
DESCRIPTION="Pluggable, composable, unopinionated modules for building a Wayland compositor"
HOMEPAGE="https://gitlab.freedesktop.org/wlroots/wlroots"
SRC_URI="https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/${PV}/downloads/${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0/14"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/libevdev
dev-libs/libffi
dev-libs/libinput
dev-libs/libudev-zero
dev-libs/wayland
media-libs/libglvnd
media-libs/mesa
sys-auth/seatd
sys-libs/glibc
sys-libs/mtdev
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libdrm
x11-libs/libxcb
x11-libs/libxkbcommon
x11-libs/pixman
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
-Dallocators=gbm \
-Dbackends=drm,libinput \
-Dexamples=false \
-Dicon_directory=/usr/share/icons \
-Drenderers=gles2 \
-Dxcb-errors=disabled \
-Dxwayland=disabled
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############
