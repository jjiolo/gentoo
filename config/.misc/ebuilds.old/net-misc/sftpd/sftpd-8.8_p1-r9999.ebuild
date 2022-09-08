#############
EAPI="7"
#############
DESCRIPTION="sftpd"
HOMEPAGE="https://www.openssh.com/"
SRC_URI="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV/_}.tar.gz -> sftpd-${PV}.tar.gz"
#############
LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libedit
sys-libs/glibc
sys-libs/ncurses
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/openssh-${PV/_}"
#############
src_configure(){
# --with-ldflags=-static
./configure \
--prefix=/usr \
--with-libedit \
--without-openssl
}
#############
src_make(){ make ${MAKEOPTS} sftp sftp-server; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 "sftp" "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "sftp-server" "${D}/sbin" || die "install failed"
}
#############
