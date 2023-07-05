#############
EAPI=8
#############
DESCRIPTION="X.Org xcvt library and cvt program"
HOMEPAGE="https://www.x.org"
SRC_URI="https://www.x.org/releases/individual/lib/${P}.tar.xz"
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
-Dwerror=true \
\
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############
