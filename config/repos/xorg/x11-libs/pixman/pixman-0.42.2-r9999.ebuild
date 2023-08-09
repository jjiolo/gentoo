#############
EAPI=8
#############
DESCRIPTION="Low-level pixel manipulation routines"
HOMEPAGE="http://www.pixman.org"
SRC_URI="https://www.x.org/releases/individual/lib/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+static-libs"
RDEPEND="sys-libs/glibc"
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
-Da64-neon=disabled \
-Darm-simd=disabled \
-Dcpu-features-path= \
-Dgnu-inline-asm=disabled \
-Dgnuplot=false \
-Dgtk=disabled \
-Diwmmxt=disabled \
-Diwmmxt2=false \
-Dlibpng=disabled \
-Dloongson-mmi=disabled \
-Dmips-dspr2=disabled \
-Dmmx=disabled \
-Dneon=disabled \
-Dopenmp=disabled \
-Dsse2=disabled \
-Dssse3=disabled \
-Dtests=disabled \
-Dtimers=false \
-Dtls=disabled \
-Dvmx=disabled
}
#############
src_compile(){ ninja -C build ${MAKEOPT} || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############

