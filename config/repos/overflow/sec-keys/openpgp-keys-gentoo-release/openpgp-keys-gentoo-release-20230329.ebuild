#############
EAPI=8
#############
DESCRIPTION="OpenPGP keys used for Gentoo releases (snapshots, stages)"
HOMEPAGE="https://www.gentoo.org/downloads/signatures/"
SRC_URI="https://dev.gentoo.org/~mgorny/dist/openpgp-keys/gentoo-release.asc.${PV}.gz"
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
