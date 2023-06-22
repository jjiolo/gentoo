#############
EAPI=8
#############
DESCRIPTION="The Cyrus SASL (Simple Authentication and Security Layer)"
HOMEPAGE="https://www.cyrusimap.org/sasl/"
SRC_URI="https://github.com/cyrusimap/${PN}/releases/download/${P}/${P}.tar.gz"
#############
LICENSE="BSD-with-attribution"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--disable-cmulocal \
--disable-sample \
--disable-obsolete_cram_attr \
--disable-obsolete_digest_attr \
--disable-dependency-tracking \
--enable-static \
--enable-shared \
--disable-fast-install \
--enable-libtool-lock \
--disable-staticdlopen \
--disable-keep-db-open \
--disable-alwaystrue \
--disable-checkapop \
--disable-cram \
--disable-digest \
--disable-scram \
--disable-otp \
--disable-srp \
--disable-srp-setpass \
--disable-krb4 \
--disable-gssapi \
--disable-gss_mutexes \
--disable-sia \
--disable-auth-sasldb \
--disable-httpform \
--enable-plain \
--disable-anon \
--disable-login \
--disable-ntlm \
--disable-passdss \
--disable-sql \
--disable-ldapdb \
--disable-macos-framework \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-purecov \
--without-purify \
--without-dbpath \
--with-dblib=none \
--without-bdb-libdir \
--without-bdb-incdir \
--without-gdbm \
--with-devrandom=/dev/urandom \
--without-saslauthd \
--without-authdaemond \
--without-pwcheck \
--with-ipctype=unix \
--without-lib-subdir \
--without-openssl \
--without-des \
--without-opie \
--without-gss_impl \
--without-pam \
--without-ldap \
--without-mysql \
--without-pgsql \
--without-sqlite \
--without-sqlite3 \
--with-plugindir=/usr/lib64/sasl2 \
--without-configdir \
--without-rc4 \
--without-dmalloc \
--without-sfio \
--with-sphinx-build=no
} 
#############
src_install(){ default ; }
#############

