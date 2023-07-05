#############
EAPI=8
#############
DESCRIPTION="Linux firmware"
HOMEPAGE="https://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git"
SRC_URI="https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/${P}.tar.xz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_install(){

 install -d -o root -g root -m 0755 "${D}/lib" "${D}/lib/firmware"

 cp -rv "${S}/." "${D}/lib/firmware"

}
#############
