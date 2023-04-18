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
RDEPEND="
sys-libs/glibc
sys-libs/libxcrypt
"
DEPEND="${RDEPEND}"
#############
src_configure(){

 sed -i 's/#define DROPBEAR_DSS 1/#define DROPBEAR_DSS 0/' sysoptions.h

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
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 "dropbearkey" "${D}/sbin" || die "install failed"
install    -o root -g root -m 0755 "dropbear" "${D}/sbin" || die "install failed"
install    -o root -g root -m 0755 "dbclient" "${D}/bin" || die "install failed"
ln -s "/sbin/dropbear" "${D}/sbin/sshd"
ln -s "/bin/dbclient" "${D}/bin/ssh"
}
#############
