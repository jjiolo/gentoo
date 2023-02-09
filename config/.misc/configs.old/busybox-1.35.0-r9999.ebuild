############
EAPI="7"
#############
DESCRIPTION="Utilities for rescue and embedded systems"
HOMEPAGE="https://busybox.net/"
SRC_URI="https://busybox.net/downloads/${P}.tar.bz2"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"

#############
src_configure() {
 cp -a "${FILESDIR}/config" "${S}/.config"
 cp -a "${FILESDIR}/scripts" "${S}/embed"


 make -j1 -s oldconfig >/dev/null
}
#############
src_install() {
install -d -o root -g root -m 0755 "${D}/bin"
install    -o root -g root -m 0755 "busybox" "${D}/bin/busybox" || die "install failed"
}
#############
