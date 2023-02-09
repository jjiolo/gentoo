#############
EAPI=8
#############
DESCRIPTION="A C++ daemon for accessing the I2P anonymous network"
HOMEPAGE="https://github.com/PurpleI2P/i2pd"
SRC_URI="https://github.com/PurpleI2P/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/boost
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){
cd build ; cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DWITH_ADDRSANITIZER=OFF \
-DWITH_AESNI=OFF \
-DWITH_BINARY=ON \
-DWITH_GIT_VERSION=OFF \
-DWITH_HARDENING=ON \
-DWITH_LIBRARY=OFF \
-DWITH_STATIC=OFF \
-DWITH_THREADSANITIZER=OFF \
-DWITH_UPNP=OFF
}
#############
src_compile(){ cd build ; default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "build/i2pd" "${D}/sbin" || die "install failed"
}
#############
