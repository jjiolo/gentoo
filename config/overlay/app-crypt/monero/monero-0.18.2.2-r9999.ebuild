#############
EAPI=8
#############
DESCRIPTION="monero daemon and command line wallet"
HOMEPAGE="https://getmonero.org"
SRC_URI="https://downloads.getmonero.org/cli/linux64 -> monero-linux-x64-v${PV}.tar.bz2"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
S="${WORKDIR}/monero-x86_64-linux-gnu-v${PV}"
#############
src_install(){
 install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
 install    -o root -g root -m 0755 "monero-wallet-cli" "${D}/bin/moneroc" || die "install failed"
}
#############
