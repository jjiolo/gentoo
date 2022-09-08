#############
EAPI="8"
#############
DESCRIPTION="make xorg werk"
HOMEPAGE="https://github.com/illiliti/libudev-zero"
SRC_URI="https://github.com/illiliti/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){ default ; }
#############
src_install(){ make DESTDIR="${D}" PREFIX="/usr" LIBDIR="/usr/lib64" install ; }
#############
