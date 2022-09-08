#############
EAPI=7
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
configure(){
cd build
cmake \
-DBoost_INCLUDE_DIR=/usr/include \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DWITH_ADDRSANITIZER=OFF \
-DWITH_AESNI=OFF \
-DWITH_BINARY=ON \
-DWITH_HARDENING=ON \
-DWITH_LIBRARY=OFF \
-DWITH_STATIC=OFF \
-DWITH_THREADSANITIZER=OFF \
-DWITH_UPNP=OFF
cd ..
}
#############
src_install() { 
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "i2pd" "${D}/sbin"
}
#############
