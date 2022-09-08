#############
EAPI=6
#############
DESCRIPTION="Lightweight but featured SMTP daemon from OpenBSD"
HOMEPAGE="http://www.opensmtpd.org/"
SRC_URI="https://www.opensmtpd.org/archives/${P/_}.tar.gz"
#############
LICENSE="ISC BSD BSD-1 BSD-2 BSD-4"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libevent
dev-libs/openssl
sys-libs/glibc
sys-libs/libxcrypt
sys-libs/zlib
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/${P/_}"
#############
PATCHES=""
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--enable-strip \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-libs \
--without-rpath \
--with-cflags \
--with-cppflags \
--with-ldflags \
--without-Werror \
--with-pie \
--with-mantype=man \
--without-auth-pam \
--without-auth-bsdauth \
--with-user-smtpd=smtpd \
--with-user-queue=smtpq \
--with-group-queue=smtpq \
--with-path-queue=/tmp/storage/services/smtpd \
--with-path-empty=/var/empty \
--with-path-mbox=/tmp/storage/services/smtpd/inbox \
--with-path-socket=/tmp/storage/services/smtpd \
--with-path-pidfile=/tmp/z.local/services/smtpd \
--with-path-CAfile=/etc/ssl/certs/ca-certificates.crt \
--with-libfts \
--without-libevent \
--without-libssl \
--with-libz \
--without-table-db
}
#############
src_install(){

install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"

install    -o root -g root -m 0755 "mk/smtp/smtp" "${D}/bin"
install    -o root -g root -m 0755 "mk/smtpd/smtpd" "${D}/sbin"
install    -o root -g root -m 0755 "mk/smtpctl/smtpctl" "${D}/sbin"

install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/libexec" "${D}/usr/libexec/opensmtpd"

install    -o root -g root -m 0755 "contrib/libexec/encrypt/encrypt" "${D}/usr/libexec/opensmtpd"
install    -o root -g root -m 0755 "contrib/libexec/lockspool/lockspool" "${D}/usr/libexec/opensmtpd"
install    -o root -g root -m 0755 "contrib/libexec/mail.local/mail.local" "${D}/usr/libexec/opensmtpd"

install    -o root -g root -m 0755 "mk/mail/mail.mda/mail.mda" "${D}/usr/libexec/opensmtpd"
install    -o root -g root -m 0755 "mk/mail/mail.mboxfile/mail.mboxfile" "${D}/usr/libexec/opensmtpd"
install    -o root -g root -m 0755 "mk/mail/mail.maildir/mail.maildir" "${D}/usr/libexec/opensmtpd"
install    -o root -g root -m 0755 "mk/mail/mail.lmtp/mail.lmtp" "${D}/usr/libexec/opensmtpd"

}
#############

