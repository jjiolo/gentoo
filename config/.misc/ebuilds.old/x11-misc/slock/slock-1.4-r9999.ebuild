#############
EAPI="8"
#############
DESCRIPTION="simple x display locker"
HOMEPAGE="https://tools.suckless.org/slock"
SRC_URI="https://dl.suckless.org/tools/${P}.tar.gz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){ cp "${FILESDIR}/config.h" "${S}" ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "slock" "${D}/sbin"
}
#############
