#############
EAPI=8
#############
DESCRIPTION="lightweight session manager with {de,at}tach support"
HOMEPAGE="https://www.brain-dump.org/projects/abduco/"
SRC_URI="https://www.brain-dump.org/projects/${PN}/${P}.tar.gz"
#############
LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_install(){
 install -d -o root -g root -m 0755 "${D}/bin"
 install    -o root -g root -m 0755 "abduco" "${D}/bin/abduco"
}
#############
