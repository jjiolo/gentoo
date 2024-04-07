#############
EAPI=8
#############
DESCRIPTION="The GNU Privacy Guard, a GPL OpenPGP implementation"
HOMEPAGE="https://www.gnupg.org/"
SRC_URI="https://gnupg.org/ftp/gcrypt/gnupg/${P}.tar.bz2"
#############
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="+ssl"
RDEPEND="
app-crypt/pinentry
dev-libs/libassuan
dev-libs/libgcrypt
dev-libs/libgpg-error
dev-libs/libksba
dev-libs/npth
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure() {
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--disable-gpgsm \
--disable-scdaemon \
--disable-g13 \
--disable-dirmngr \
--disable-keyboxd \
--disable-tpm2d \
--disable-doc \
--disable-gpgtar \
--disable-wks-tools \
--disable-gpg-is-gpg2 \
--disable-selinux-support \
--enable-large-secmem \
--enable-trust-models \
--disable-tofu \
--disable-libdns \
--enable-gpg-rsa \
--enable-gpg-ecdh \
--enable-gpg-ecdsa \
--enable-gpg-eddsa \
--enable-gpg-idea \
--enable-gpg-cast5 \
--enable-gpg-blowfish \
--enable-gpg-aes128 \
--enable-gpg-aes192 \
--enable-gpg-aes256 \
--enable-gpg-twofish \
--enable-gpg-camellia128 \
--enable-gpg-camellia192 \
--enable-gpg-camellia256 \
--enable-gpg-md5 \
--enable-gpg-rmd160 \
--enable-gpg-sha224 \
--enable-gpg-sha384 \
--enable-gpg-sha512 \
--enable-zip \
--enable-bzip2 \
--disable-exec \
--disable-photo-viewers \
--enable-key-cache=4096 \
--disable-card-support \
--disable-ccid-driver \
--disable-dirmngr-auto-start \
--disable-maintainer-mode \
--enable-largefile \
--disable-sqlite \
--disable-npth-debug \
--disable-ntbtls \
--disable-gnutls \
--disable-ldap \
--disable-rpath \
--disable-nls \
--enable-endian-check \
--disable-optimization \
--disable-log-clock \
--disable-werror \
--disable-all-tests \
--disable-tests \
--disable-run-gnupg-user-socket \
--disable-build-timestamp \
\
--with-agent-pgm=/usr/bin/gpg-agent \
--with-pinentry-pgm=/usr/bin/pinentry \
--without-scdaemon-pgm \
--without-tpm2daemon-pgm \
--without-dirmngr-pgm \
--without-keyboxd-pgm \
--without-protect-tool-pgm \
--without-dirmngr-ldap-pgm \
--with-agent-s2k-calibration=13000 \
--without-photo-viewer \
--without-capabilities \
--without-libgpg-error-prefix \
--without-libgcrypt-prefix \
--without-libassuan-prefix \
--without-libksba-prefix \
--without-npth-prefix \
--without-ntbtls-prefix \
--without-default-trust-store-file \
--without-ldap \
--without-mailprog \
--with-gnu-ld \
--without-libiconv-prefix \
--without-libintl-prefix \
--without-zlib \
--without-bzip2 \
--without-readline \
--without-tss
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "${S}/g10/gpg" "${D}/usr/bin" || die "install fail"
install    -o root -g root -m 0755 "${S}/agent/gpg-agent" "${D}/usr/bin" || die "install fail"
}
#############
