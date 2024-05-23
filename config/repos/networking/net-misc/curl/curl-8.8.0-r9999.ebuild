#############
EAPI=8
#############
DESCRIPTION="A Client that groks URLs"
HOMEPAGE="https://curl.haxx.se/"
SRC_URI="https://curl.haxx.se/download/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+ssl +http2"
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
--disable-httpsrr \
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
--disable-docs \
--disable-libcurl-option \
--disable-libgcc \
--enable-ipv6 \
--disable-openssl-auto-load-config \
--disable-versioned-symbols \
--disable-threaded-resolver \
--disable-pthreads \
--disable-verbose \
--disable-sspi \
--enable-basic-auth \
--enable-bearer-auth \
--disable-digest-auth \
--disable-kerberos-auth \
--disable-negotiate-auth \
--disable-aws \
--disable-ntlm \
--disable-tls-srp \
--enable-unix-sockets \
--disable-cookies \
--disable-socketpair \
--enable-http-auth \
--disable-doh \
--disable-mime \
--disable-bindlocal \
--disable-form-api \
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
--without-test-nghttpx \
--without-test-caddy \
--without-test-vsftpd \
--without-test-httpd \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-hyper \
--without-zlib \
--without-brotli \
--without-zstd \
--without-ldap-lib \
--without-lber-lib \
--without-gssapi-includes \
--without-gssapi-libs \
--without-gssapi \
--without-default-ssl-backend \
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
--without-openssl-quic \
--without-nghttp3 \
--without-quiche \
--without-msh3 \
--without-zsh-functions-dir \
--without-fish-functions-dir
}
#############
src_install(){ default; }
#############
