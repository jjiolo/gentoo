#############
EAPI=7
#############
DESCRIPTION="System Security Services Daemon provides access to identity and authentication"
HOMEPAGE="https://github.com/SSSD/sssd"
SRC_URI="https://github.com/SSSD/sssd/releases/download/${PV}/${P}.tar.gz"
#############
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
#############
src_configure(){ default ; }
src_install(){ default ; }
#############
