#############
EAPI="7"
#############
DESCRIPTION="A Client that groks URLs"
HOMEPAGE="https://curl.haxx.se/"
SRC_URI="https://curl.haxx.se/download/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+ssl"
RDEPEND="
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--disable-maintainer-mode \
--enable-silent-rules \
--disable-debug \
--disable-optimize \
--disable-warnings \
--disable-werror \
--disable-curldebug \
--enable-symbol-hiding \
--disable-ares \
--disable-rt \
--disable-ech \
--disable-code-coverage \
--disable-dependency-tracking \
--enable-largefile \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--enable-http \
--disable-ftp \
--disable-file \
--disable-ldap \
--disable-ldaps \
--disable-rtsp \
--disable-proxy \
--disable-dict \
--disable-telnet \
--disable-tftp \
--disable-pop3 \
--disable-imap \
--disable-smb \
--disable-smtp \
--disable-gopher \
--disable-mqtt \
--disable-manual \
--disable-libcurl-option \
--disable-libgcc \
--enable-ipv6 \
--disable-openssl-auto-load-config \
--disable-versioned-symbols \
--disable-threaded-resolver \
--disable-pthreads \
--disable-verbose \
--disable-sspi \
--disable-crypto-auth \
--disable-ntlm \
--disable-ntlm-wb \
--disable-tls-srp \
--enable-unix-sockets \
--disable-cookies \
--disable-socketpair \
--enable-http-auth \
--disable-doh \
--disable-mime \
--disable-dateparse \
--disable-netrc \
--enable-progress-meter \
--disable-dnsshuffle \
--disable-get-easy-options \
--disable-alt-svc \
--disable-headers-api \
--disable-hsts \
--disable-websockets \
\
--without-schannel \
--without-secure-transport \
--without-amissl \
--with-ssl \
--with-openssl \
--without-gnutls \
--without-mbedtls \
--without-wolfssl \
--without-bearssl \
--without-rustls \
--without-nss-deprecated \
--without-nss \
--without-test-nghttpx \
--without-test-caddy \
--without-test-httpd \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-hyper \
--with-zlib \
--without-brotli \
--without-zstd \
--without-ldap-lib \
--without-lber-lib \
--without-gssapi-includes \
--without-gssapi-libs \
--without-gssapi \
--without-default-ssl-backend \
--without-egd-socket \
--with-random=/dev/urandom \
--with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
--with-ca-path=/etc/ssl/certs \
--without-ca-fallback \
--without-libpsl \
--without-libgsasl \
--without-libssh2 \
--without-libssh \
--without-wolfssh \
--without-librtmp \
--without-winidn \
--without-libidn2 \
--without-nghttp2 \
--without-ngtcp2 \
--without-nghttp3 \
--without-quiche \
--without-msh3 \
--without-zsh-functions-dir \
--without-fish-functions-dir \
--without-n64-deprecated
}
#############
src_install(){ default; }
#############