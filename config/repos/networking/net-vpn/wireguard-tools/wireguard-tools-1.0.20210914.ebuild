#############
EAPI=8
#############
DESCRIPTION="Required tools for WireGuard, such as wg(8) and wg-quick(8)"
HOMEPAGE="https://www.wireguard.com/"
SRC_URI="https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-${PV}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){ default ; }
#############
src_compile(){ LDFLAGS=-static make -C src ${MAKEOPTS} ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/sbin"
install    -o root -g root -m 0755 "src/wg" "${D}/usr/sbin" || die "install failed"
}
#############
