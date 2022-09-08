#############
EAPI=7
#############
DESCRIPTION="Modern asynchronous DNS API"
HOMEPAGE="https://getdnsapi.net/"
SRC_URI="https://getdnsapi.net/releases/${P//./-}/${P}.tar.gz"
#############
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="
dev-libs/libbsd
dev-libs/libyaml
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/getdns-1.6.0-beta.1"
#############
src_configure() {
cmake \
-DBUILD_DOXYGEN=OFF \
-DBUILD_EXAMPLES=OFF \
-DBUILD_GETDNS_QUERY=OFF \
-DBUILD_GETDNS_SERVER_MON=OFF \
-DBUILD_STUBBY=ON \
-DBUILD_TESTING=OFF \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DCURRENT_DATE= \
-DDNSSEC_ROADBLOCK_AVOIDANCE=ON \
-DENABLE_DEBUG_ALL=OFF \
-DENABLE_DEBUG_ANCHOR=OFF \
-DENABLE_DEBUG_DAEMON=OFF \
-DENABLE_DEBUG_DNSSEC=OFF \
-DENABLE_DEBUG_REQ=OFF \
-DENABLE_DEBUG_SCHED=OFF \
-DENABLE_DEBUG_SERVER=OFF \
-DENABLE_DEBUG_STUB=OFF \
-DENABLE_DRAFT_MDNS_SUPPORT=OFF \
\
-DENABLE_DSA=ON \
-DENABLE_ECDSA=ON \
-DENABLE_ED25519=ON \
-DENABLE_ED448=ON \
-DENABLE_EDNS_COOKIES=ON \
-DENABLE_GOST=ON \
-DENABLE_NATIVE_STUB_DNSSEC=ON \
-DENABLE_POLL_EVENTLOOP=ON \
-DENABLE_SHA1=ON \
-DENABLE_SHA2=ON \
\
-DENABLE_SHARED=OFF \
-DENABLE_STATIC=ON \
-DENABLE_STUB_ONLY=ON \
-DENABLE_TCP_FAST_OPEN=OFF \
-DENABLE_UNBOUND_EVENT_API=OFF \
-DFD_SETSIZE=4096 \
-DMAX_UDP_BACKOFF=1000 \
-DPATH_HOSTS=/etc/hosts \
-DPATH_RESOLVCONF=/etc/resolv.conf \
-DPATH_TRUST_ANCHOR_FILE=/storage/services/dnsd/root.anchors \
-DUSE_GNUTLS=OFF \
-DUSE_LIBEV=OFF \
-DUSE_LIBEVENT2=OFF \
-DUSE_LIBIDN2=OFF \
-DUSE_LIBUV=OFF
}
#############
src_install() {
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 "stubby/stubby" "${D}/sbin"
}
#############

