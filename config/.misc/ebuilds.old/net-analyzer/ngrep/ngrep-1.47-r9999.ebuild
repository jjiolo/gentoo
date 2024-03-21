#############
EAPI="8"
#############
DESCRIPTION="A grep for network layers"
HOMEPAGE="https://github.com/jpr5/ngrep"
SRC_URI="https://github.com/jpr5/ngrep/archive/V${PV/./_}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="ngrep"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
S="${WORKDIR}/${P/./_}"
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
