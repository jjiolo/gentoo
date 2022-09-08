#############
EAPI=7
#############
DESCRIPTION="Network Information Service tools"
HOMEPAGE="https://www.kernel.org"
SRC_URI="https://cdn.kernel.org/pub/linux/utils/net/NIS/${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="${DEPEND}"
DEPEND="${RDEPEND}"
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
