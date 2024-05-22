#############
EAPI=8
#############
DESCRIPTION="a relatively small ssh server and client"
HOMEPAGE="https://matt.ucc.asn.au/dropbear/dropbear.html"
SRC_URI="https://matt.ucc.asn.au/dropbear/releases/${P}.tar.bz2"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){

./configure \
--prefix=/usr \
--enable-option-checking \
--disable-static \
--enable-harden \
--disable-werror \
--enable-largefile \
--disable-zlib \
--disable-pam \
--enable-openpty \
--enable-syslog \
--disable-shadow \
--disable-plugin \
--disable-fuzz \
--enable-bundled-libtom \
--disable-lastlog \
--disable-utmp \
--disable-utmpx \
--disable-wtmp \
--disable-wtmpx \
--enable-loginfunc \
--disable-pututline \
--disable-pututxline \
\
--with-zlib=/usr/lib64 \
--with-pam=/usr/lib64 \
--with-lastlog=/run/lastlog

cp -a "${FILESDIR}/localoptions.h" "${S}/localoptions.h"

}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/sbin"
install    -o root -g root -m 0755 "dropbearkey" "${D}/usr/sbin" || die "install failed"
install    -o root -g root -m 0755 "dropbear" "${D}/usr/sbin" || die "install failed"
install    -o root -g root -m 0755 "dbclient" "${D}/usr/bin" || die "install failed"
ln -s "dropbear" "${D}/usr/sbin/sshd"
ln -s "dbclient" "${D}/usr/bin/ssh"
}
#############
