#############
EAPI=7
#############
DESCRIPTION="Mass IP port scanner"
HOMEPAGE="https://github.com/robertdavidgraham/masscan"
SRC_URI="https://github.com/robertdavidgraham/masscan/archive/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="net-libs/libpcap"
DEPEND=""
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
