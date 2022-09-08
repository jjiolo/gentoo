#############
EAPI=7
#############
DESCRIPTION="An interface for filesystems implemented in userspace"
HOMEPAGE="https://github.com/libfuse/libfuse"
SRC_URI="https://github.com/libfuse/libfuse/archive/${P}.tar.gz"
#############
LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND} dev-util/meson dev-util/ninja"
S="${WORKDIR}/libfuse-${P}"
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
-Ddisable-mtab=true \
-Dexamples=false \
-Dtests=false \
-Dudevrulesdir=/lib/udev/rules.d \
-Duseroot=false \
-Dutils=true
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install ; }
#############
