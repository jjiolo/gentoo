#############
EAPI=8
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
--disable-dependency-tracking \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
\
--with-pic \
--with-gnu-ld \
--with-sysroot \
--without-libbsd \
--without-rpath \
--with-cflags \
--with-cppflags \
--with-ldflags \
--without-Werror \
--with-pie \
\
--without-auth-bsdauth \
--without-auth-pam \
--with-user-smtpd=maild \
--with-user-queue=mailq \
--with-group-queue=mailq \
--with-path-queue=/tmp/storage/services/maild \
--with-path-empty=/var/empty \
--with-path-mbox=/tmp/storage/home/mail/local \
--with-path-socket=/tmp/storage/services/maild \
--with-path-pidfile=/tmp/storage/services/maild \
--with-path-CAfile=/etc/ssl/certs/ca-certificates.crt \
--with-libfts \
--with-libevent=/usr/lib64 \
--with-libssl=/usr/lib64 \
--with-libz=/usr/lib64 \
--without-table-db
# --without-mantype --with-mantype={man,cat,doc}
}
#############
src_install(){

install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"

install    -o root -g root -m 0755 "mk/smtpd/smtpd" "${D}/sbin" || die "install failed"

install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/libexec" "${D}/usr/libexec/opensmtpd"

install    -o root -g root -m 0755 "mk/mail/mail.maildir/mail.maildir" "${D}/usr/libexec/opensmtpd" || die "install failed"

ln -s "/sbin/smtpd" "${D}/sbin/maild"

}
#############

