#############
EAPI=7
#############
DESCRIPTION="Multithreaded, small, efficient SOCKS5 server"
HOMEPAGE="https://github.com/rofl0r/microsocks"
SRC_URI="https://github.com/rofl0r/microsocks/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND=""
#############
src_configure(){ sed -ie '/^prefix =/c prefix = /usr' Makefile ; }
#############
src_install(){ default ; }
#############
