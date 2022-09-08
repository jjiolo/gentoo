#############
EAPI=7
#############
DESCRIPTION="Network Information Service tools"
HOMEPAGE="https://github.com/thkukuk/yp-tools"
SRC_URI="https://github.com/thkukuk/yp-tools/archive/refs/tags/v4.2.3.tar.gz -> yp-tools-4.3.4.tar.gz"
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
