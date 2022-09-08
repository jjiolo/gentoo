#############
EAPI=7
#############
DESCRIPTION="a set of command-line programs providing a simple interface to inotify"
HOMEPAGE="https://github.com/inotify-tools/inotify-tools"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc"
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure() {
autoreconf -i
LDFLAGS=--static ./configure \
--prefix=/usr \
--enable-option-checking \
--disable-dependency-tracking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--disable-doxygen \
--enable-static-binary \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot
}
#############
src_install() {
install -d -o 0 -g 0 -m 0755 "${D}/bin"
install    -o 0 -g 0 -m 0755 "src/inotifywait" "${D}/bin"
install    -o 0 -g 0 -m 0755 "src/inotifywatch" "${D}/bin"
}
#############
