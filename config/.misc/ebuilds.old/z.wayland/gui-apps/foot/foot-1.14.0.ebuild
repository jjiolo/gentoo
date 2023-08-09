#############
EAPI=8
#############
DESCRIPTION="Fast, lightweight and minimalistic Wayland terminal emulator"
HOMEPAGE="https://codeberg.org/dnkl/foot"
SRC_URI="https://codeberg.org/dnkl/foot/archive/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/libffi
dev-libs/wayland
media-libs/fcft
media-libs/fontconfig
media-libs/freetype
media-libs/libpng
sys-libs/glibc
sys-libs/zlib
x11-libs/libxkbcommon
x11-libs/pixman
"
DEPEND="
${RDEPEND}
dev-libs/wayland-protocols
"
S="${WORKDIR}/${PN}"
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
-Dcustom-terminfo-install-location=/etc/terminfo \
-Ddefault-terminfo=foot \
-Ddefault-utempter-path=auto \
-Ddocs=disabled \
-Dgrapheme-clustering=disabled \
-Dime=false \
-Dsystemd-units-dir=/usr/lib/systemd/system \
-Dterminfo=disabled \
-Dtests=false \
-Dthemes=false
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){

install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "build/foot" "${D}/usr/bin" || die "install failed"

sed -i 's/@default_terminfo@/foot/' foot.info
install -d -o root -g root -m 0755 "${D}/etc" "${D}/etc/terminfo"
[ -f /usr/bin/tic ] && tic -o "${D}/etc/terminfo" -sx foot.info
[ -f /usr/bin/x86_64-pc-linux-gnu-tic ] && x86_64-pc-linux-gnu-tic -o "${D}/etc/terminfo" -sx foot.info

}
#############
