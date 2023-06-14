#############
EAPI=8
#############
DESCRIPTION="Gentoo Authority Keys (GLEP 79)"
HOMEPAGE="https://www.gentoo.org/downloads/signatures/"
SRC_URI="https://dev.gentoo.org/~mgorny/dist/openpgp-keys/gentoo-auth.asc.${PV}.gz"
#############
LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}"
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
