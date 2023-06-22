#############
EAPI=8
#############
DESCRIPTION="Emulates the detach feature of screen"
HOMEPAGE="https://github.com/crigler/dtach"
SRC_URI="https://github.com/crigler/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_install(){
 install -d -o root -g root -m 0755 "${D}/bin"
 install    -o root -g root -m 0755 "dtach" "${D}/bin/dtach" || die "install failed"
}
#############
