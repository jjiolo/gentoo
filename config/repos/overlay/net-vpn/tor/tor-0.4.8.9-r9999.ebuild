#############
EAPI=8
#############
DESCRIPTION="Anonymizing overlay network for TCP"
HOMEPAGE="https://www.torproject.org/"
SRC_URI="https://dist.torproject.org/${P}.tar.gz"
#############
LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libevent
dev-libs/openssl
sys-libs/glibc
sys-libs/libcap
sys-libs/libseccomp
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure() {
# --disable-asserts-in-tests\ # errors if unittests disabled
./configure \
--prefix=/usr \
--sysconfdir=/etc \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-gpl \
--disable-openbsd-malloc \
--disable-static-openssl \
--disable-static-libevent \
--disable-static-zlib \
--disable-static-tor \
--disable-unittests \
--disable-coverage \
\
--disable-system-torrc \
--disable-libfuzzer \
--disable-oss-fuzz \
--enable-memory-sentinels \
--disable-restart-debugging \
--disable-zstd-advanced-apis \
--disable-nss \
--enable-pic \
--disable-missing-doc-warnings \
--disable-manpage \
--disable-html-manual \
--disable-asciidoc \
--disable-systemd \
--disable-gcc-warnings \
--disable-fatal-warnings \
--disable-gcc-warnings-advisory \
--enable-gcc-hardening \
--disable-expensive-hardening \
--disable-fragile-hardening \
--disable-all-bugs-are-fatal \
--enable-linker-hardening \
--disable-local-appdata \
--disable-tool-name-check \
--enable-seccomp \
--disable-libscrypt \
--disable-tracing-instrumentation-lttng \
--disable-tracing-instrumentation-usdt \
--disable-tracing-instrumentation-log-debug \
--disable-android \
--disable-module-relay \
--disable-module-dirauth \
--enable-module-pow \
--disable-lzma \
--disable-zstd \
--enable-largefile \
\
--with-tor-user=tord \
--with-tor-group=tord \
--with-libevent-dir=/usr/lib64 \
--with-ssl-dir=/usr/lib64 \
--with-openssl-dir=/usr/lib64 \
--with-zlib-dir=/usr/lib64 \
--without-tcmalloc \
--with-malloc=system \
--with-syslog-facility=LOG_DAEMON
}
#############
src_install() {
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "src/app/tor" "${D}/sbin" || die "install failed"
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/share" "${D}/usr/share/tor"
install    -o root -g root -m 0644 "src/config/geoip" "${D}/usr/share/tor" || die "install failed"
install    -o root -g root -m 0644 "src/config/geoip6" "${D}/usr/share/tor" || die "install failed"
ln -s "/sbin/tor" "${D}/sbin/ddns"
}
#############
