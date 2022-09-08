#############
EAPI="7"
#############
DESCRIPTION="A validating, recursive and caching DNS resolver"
HOMEPAGE="https://unbound.net/ https://nlnetlabs.nl/projects/unbound/about/"
SRC_URI="https://nlnetlabs.nl/downloads/unbound/${P}.tar.gz"
#############
LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/libbsd
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--enable-option-checking \
--disable-checking \
--disable-debug \
--enable-flto \
--enable-pie \
--enable-relro-now \
--disable-shared \
--enable-static \
--enable-fast-install \
--enable-libtool-lock \
--disable-rpath \
--enable-largefile \
--disable-systemd \
--disable-alloc-checks \
--disable-alloc-lite \
--disable-alloc-nonregional \
--disable-swig-version-check \
--disable-sha1 \
--disable-sha2 \
--disable-subnet \
--disable-gost \
--disable-ecdsa \
--disable-dsa \
--disable-ed25519 \
--disable-ed448 \
--disable-event-api \
--disable-tfo-client \
--disable-tfo-server \
--disable-static-exe \
--disable-fully-static \
--disable-lock-checks \
--disable-allsymbols \
--disable-dnstap \
--disable-dnscrypt \
--disable-cachedb \
--disable-ipsecmod \
--disable-ipset \
\
--with-conf-file=/etc/unbound/unbound.conf \
--with-run-dir=/var/empty \
--with-chroot-dir=/var/empty \
--with-share-dir=/usr/share/unbound \
--with-pidfile=/tmp/unbound.pid \
--with-rootkey-file=/etc/unbound/root.key \
--with-rootcert-file=/etc/unbound/root.crt \
--with-username=unbound \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-pthreads \
--without-solaris-threads \
--with-syslog-facility=DAEMON \
--without-pyunbound \
--without-pythonmodule \
\
\
--with-ssl \
--without-libbsd \
--without-libevent \
\
--without-libhiredis \
--without-dnstap-socket-path \
--without-protobuf-c \
--without-libfstrm \
--without-libsodium \
--without-libmnl \
--without-libunbound-only
# --without-nss\
# --without-nettle\
# --without-libexpat\
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "unbound" "${D}/sbin/unbound"
install    -o root -g root -m 0755 "unbound-anchor" "${D}/sbin/unbound-anchor"
}
#############
