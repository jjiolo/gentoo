#############
EAPI=8
#############
DESCRIPTION="Standard (de)compression library"
HOMEPAGE="https://zlib.net/"
SRC_URI="https://zlib.net/${P}.tar.xz"
#############
LICENSE="ZLIB"
SLOT="0/1"
KEYWORDS="amd64"
IUSE="+static-libs"
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){ ./configure --prefix=/usr --libdir=/usr/lib64 ; }
#############
src_install(){ make DESTDIR="${D}" LDCONFIG=: install ; }
#############
