#############
EAPI="7"
#############
DESCRIPTION="Port of OpenBSD's free SSH release"
HOMEPAGE="https://www.openssh.com/"
SRC_URI="https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/${P/_}.tar.gz" #SRC_URI="https://cloudflare.cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/${P}.tar.gz"
#############
LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="
${RDEPEND}
sys-libs/glibc[static-libs]
sys-libs/zlib[static-libs]
"
S="${WORKDIR}/${P/_}"
#############
src_configure(){
./configure \
--with-ldflags="-static" \
--prefix="/usr" \
--bindir="/bin" \
--sbindir="/sbin" \
--libexecdir="/usr/libexec" \
--sysconfdir="/etc/ssh" \
--runstatedir="/run" \
\
--enable-option-checking \
--enable-largefile \
--disable-pkcs11 \
--disable-security-key \
--enable-strip \
--disable-etc-default-login \
--disable-lastlog \
--disable-utmp \
--disable-utmpx \
--disable-wtmp \
--disable-wtmpx \
--disable-libutil \
--disable-pututline \
--disable-pututxline \
\
--without-openssl \
--with-stackprotect \
--with-hardening \
--without-rpath \
--without-Werror \
--without-solaris-contracts \
--without-solaris-projects \
--without-solaris-privs \
--without-osfsia \
--with-zlib \
--without-zlib-version-check \
--without-ldns \
--without-libedit \
--without-audit \
--with-pie \
--without-security-key-builtin \
--without-ssl-dir \
--without-openssl-header-check \
--without-ssl-engine \
--without-prngd-port \
--without-prngd-socket \
--without-pam \
--with-pam-service=openssh \
--with-privsep-user=sshd \
--with-sandbox=seccomp_filter \
--without-selinux \
--without-kerberos5 \
--with-privsep-path=/var/empty \
--with-xauth=/usr/bin/xauth \
--with-maildir=/tmp \
--with-mantype=man \
--without-md5-passwords \
--without-shadow \
--without-ipaddr-display \
--with-default-path="/bin:/sbin:/usr/bin:/usr/sbin" \
--with-superuser-path="/bin:/sbin:/usr/bin:/usr/sbin" \
--without-4in6 \
--without-bsd-auth \
--without-pid-dir \
--without-lastlog
}
#############
src_install(){
strip -s ssh-keygen ssh sftp sshd
install -d -o root -g root -m 0755 "${D}/etc" "${D}/etc/ssh"
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 ssh-keygen "${D}/bin"
install    -o root -g root -m 0755 ssh "${D}/bin"
install    -o root -g root -m 0755 sftp "${D}/bin"
install    -o root -g root -m 0755 sshd "${D}/sbin"
install    -o root -g root -m 0644 moduli "${D}/etc/ssh"
}
#############
