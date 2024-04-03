############
EAPI=8
#############
DESCRIPTION="Utilities for rescue and embedded systems"
HOMEPAGE="https://busybox.net/"
SRC_URI="https://busybox.net/downloads/busybox-${PV}.tar.bz2"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}/busybox-${PV}"
#############
src_configure() {
 cp -a "${FILESDIR}/config" "${S}/.config"
 make -j1 -s oldconfig >/dev/null
 sed -ie '131,151d' loginutils/su.c
 sed -ie '87d' loginutils/su.c
 sed -ie '131 i\syslog(LOG_NOTICE, "%c %s %s:%s", '\''+'\'', tty, old_user, opt_username);' loginutils/su.c
}
#############
src_install() {
install -d -o root -g root  -m 0755 "${D}/usr/bin"
install    -o root -g wheel -m 4750 "busybox" "${D}/usr/bin/sudo" || die "install failed"
}
#############
