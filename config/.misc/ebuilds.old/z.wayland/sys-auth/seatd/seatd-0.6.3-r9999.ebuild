#############
EAPI=8
#############
DESCRIPTION="Minimal seat management daemon and universal library"
HOMEPAGE="https://sr.ht/~kennylevinsen/seatd"
SRC_URI="https://git.sr.ht/~kennylevinsen/seatd/archive/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
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
-Ddefaultpath=/run \
-Dexamples=disabled \
-Dlibseat-builtin=enabled \
-Dlibseat-logind=disabled \
-Dlibseat-seatd=enabled \
-Dman-pages=disabled \
-Dserver=enabled
}
#############
src_compile(){ ninja -C build -j16 -l16 ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install ; }
#############
