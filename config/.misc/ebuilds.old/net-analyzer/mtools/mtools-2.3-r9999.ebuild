#############
EAPI="8"
#############
DESCRIPTION="Tools for multicast testing (msend and mreceive)"
HOMEPAGE="https://www.cs.virginia.edu/~mngroup/software"
SRC_URI="https://github.com/troglobit/mtools/releases/download/v${PV}/${P}.tar.gz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){ default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 "mreceive" "${D}/sbin"
install    -o root -g root -m 0755 "msend" "${D}/bin"
}
#############
