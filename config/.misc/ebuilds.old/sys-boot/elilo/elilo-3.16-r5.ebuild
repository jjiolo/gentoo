#############
EAPI=8
#############
DESCRIPTION="Linux boot loader for EFI-based systems"
HOMEPAGE="https://sourceforge.net/projects/elilo/"
SRC_URI="https://sourceforge.net/projects/${PN}/files/${PN}/${P}/${P}-all.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND=""
S="${WORKDIR}/${P}-source"
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
