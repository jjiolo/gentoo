############
EAPI=8
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

install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin" "${D}/usr/sbin"
install    -o root -g root -m 0755 "busybox" "${D}/usr/bin" || die "install failed"

busybox --list-full | while read ; do ln -s "/usr/bin/busybox" "${D}/usr/${REPLY}" ; done

rm "${D}/usr/bin/ps" # procps collision
rm "${D}/usr/bin/clear" # ncurses
rm "${D}/usr/bin/reset" # ncurses

}
#############
