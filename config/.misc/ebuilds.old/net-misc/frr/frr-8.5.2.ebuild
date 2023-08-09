#############
EAPI=8
#############
DESCRIPTION="The FRRouting Protocol Suite"
HOMEPAGE="https://frrouting.org/"
SRC_URI="https://github.com/FRRouting/frr/archive/${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}/frr-${P}"
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
