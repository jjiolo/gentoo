#############
EAPI="8"
#############
DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}/${P}"
PATCHES=( "${FILESDIR}/patches/file.patch" )
#############
src_configure(){ default ; }
#############
src_install(){ default ; }
#############
