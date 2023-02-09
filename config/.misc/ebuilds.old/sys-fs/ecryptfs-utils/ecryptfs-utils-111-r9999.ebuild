#############
EAPI=7
#############
DESCRIPTION="eCryptfs userspace utilities"
HOMEPAGE="https://launchpad.net/ecryptfs"
SRC_URI="https://launchpad.net/ecryptfs/trunk/${PV}/+download/${P/-/_}.orig.tar.gz -> ${P}.tar.gz" 
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND=""
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
