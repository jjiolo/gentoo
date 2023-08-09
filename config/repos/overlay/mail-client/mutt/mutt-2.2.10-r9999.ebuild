#############
EAPI=8
#############
DESCRIPTION="A small but very powerful text-based mail client"
HOMEPAGE="https://www.mutt.org/"
SRC_URI="https://bitbucket.org/mutt/mutt/downloads/${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="
app-crypt/gpgme
dev-libs/cyrus-sasl
dev-libs/libassuan
dev-libs/libgpg-error
dev-libs/openssl
sys-libs/glibc
sys-libs/ncurses
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){
# --without-slang #
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-largefile \
--disable-autocrypt \
--enable-gpgme \
--disable-pgp \
--disable-smime \
--disable-sidebar \
--disable-compressed \
--disable-external-dotlock \
--enable-pop \
--disable-imap \
--enable-smtp \
--disable-debug \
--disable-flock \
--enable-fcntl \
--disable-filemonitor \
--disable-warnings \
--disable-nfs-fix \
--disable-mailtool \
--disable-locales-fix \
--disable-exact-address \
--disable-hcache \
--disable-iconv \
--disable-nls \
--disable-rpath \
--disable-doc \
--disable-full-doc \
\
--without-sqlite3 \
--without-libgpg-error-prefix \
--without-gpgme-prefix \
--without-mixmaster \
\
--with-curses \
--without-bundled-regex \
--without-homespool \
--without-mailpath \
--without-docdir \
--without-domain \
--without-gss \
--without-zlib \
--with-ssl \
--without-gnutls \
--with-sasl \
--without-gsasl \
--with-exec-shell=/bin/sh \
--without-kyotocabinet \
--without-tokyocabinet \
--without-lmdb \
--without-qdbm \
--without-gdbm \
--without-bdb \
--with-gnu-ld \
--without-libiconv-prefix \
--without-libintl-prefix \
--without-idn \
--without-idn2 \
--without-wc-funcs
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin"
install    -o root -g root -m 0755 "mutt" "${D}/bin" || die "install failed"
}
#############
