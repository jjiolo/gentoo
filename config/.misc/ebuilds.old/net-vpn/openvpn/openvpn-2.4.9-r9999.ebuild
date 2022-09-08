#############
EAPI="7"
#############
DESCRIPTION="Robust and highly flexible tunneling application compatible with many OSes"
HOMEPAGE="https://openvpn.net/"
SRC_URI="https://swupdate.openvpn.org/community/releases/${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){
autoreconf -i
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--disable-lzo \
--disable-lz4 \
--disable-comp-stub \
--enable-crypto \
--disable-ofb-cfb \
--disable-x509-alt-username \
--enable-server \
--disable-plugins \
--disable-management \
--disable-pkcs11 \
--disable-fragment \
--disable-multihome \
--disable-port-share \
--disable-debug \
--disable-small \
--enable-iproute2 \
--disable-def-auth \
--disable-pf \
--disable-plugin-auth-pam \
--disable-plugin-down-root \
--disable-pam-dlopen \
--disable-strict \
--disable-pedantic \
--disable-werror \
--disable-strict-options \
--disable-selinux \
--disable-systemd \
--disable-async-push \
--disable-shared \
--enable-static \
--enable-fast-install \
--enable-libtool-lock \
\
--without-special-build \
--with-mem-check=no \
--with-crypto-library=openssl \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 src/openvpn/openvpn "${D}/sbin/openvpn"
}
#############

