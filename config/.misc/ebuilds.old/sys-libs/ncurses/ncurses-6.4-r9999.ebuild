#############
EAPI=8
#############
DESCRIPTION="Console display library"
HOMEPAGE="https://invisible-island.net/ncurses/announce.html"
SRC_URI="http://ftp.gnu.org/gnu/ncurses/${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+static-libs"
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){ ./configure --prefix=/usr --libdir=/usr/lib64 --with-shared --enable-widec --with-termlib ; }
#############
src_install(){ default ; }
#############
