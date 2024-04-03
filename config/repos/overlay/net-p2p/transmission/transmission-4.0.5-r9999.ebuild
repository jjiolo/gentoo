#############
EAPI=8
#############
DESCRIPTION="transmission bittorrent client"
HOMEPAGE="https://www.transmissionbt.com"
SRC_URI="https://github.com/transmission/transmission/releases/download/4.0.0/${P}.tar.xz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/openssl
net-misc/curl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){

mkdir build

cd build

cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DENABLE_CLI=OFF \
-DENABLE_DAEMON=ON \
-DENABLE_DEPRECATED=OFF \
-DENABLE_GTK=OFF \
-DENABLE_MAC=OFF \
-DENABLE_NLS=OFF \
-DENABLE_QT=OFF \
-DENABLE_TESTS=OFF \
-DENABLE_UTILS=ON \
-DENABLE_UTP=ON \
-DENABLE_WERROR=ON \
-DINSTALL_DOC=OFF \
-DINSTALL_LIB=OFF \
-DINSTALL_WEB=OFF \
\
-DLIBB64_BUILD_EXAMPLES=OFF \
-DLIBB64_BUILD_PROGRAMS=OFF \
-DLIBB64_ENABLE_INSTALL=OFF \
-DLIBB64_ENABLE_TESTS=OFF \
-DLIBB64_ENABLE_WERROR=OFF \
\
-DLIBUTP_BUILD_PROGRAMS=OFF \
-DLIBUTP_ENABLE_INSTALL=OFF \
-DLIBUTP_ENABLE_WERROR=OFF \
\
-DREBUILD_WEB=OFF \
\
-DRUN_CLANG_TIDY=OFF \
\
-DUSE_GTK_VERSION=OFF \
-DUSE_QT_VERSION=OFF \
\
-DUSE_SYSTEM_B64=OFF \
-DUSE_SYSTEM_DEFLATE=OFF \
-DUSE_SYSTEM_DHT=OFF \
-DUSE_SYSTEM_EVENT2=OFF \
-DUSE_SYSTEM_MINIUPNPC=OFF \
-DUSE_SYSTEM_NATPMP=OFF \
-DUSE_SYSTEM_PSL=OFF \
-DUSE_SYSTEM_UTP=OFF \
\
-DWITH_APPINDICATOR=OFF \
\
-DWITH_CRYPTO=openssl \
-DWITH_INOTIFY=ON \
-DWITH_KQUEUE=OFF \
-DWITH_SYSTEMD=OFF ..

}
#############
src_compile(){ cd build ; default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/sbin"
install    -o root -g root -m 0755 "build/utils/transmission-create"  "${D}/usr/bin" || die "install failed"
install    -o root -g root -m 0755 "build/utils/transmission-edit"    "${D}/usr/bin" || die "install failed"
install    -o root -g root -m 0755 "build/utils/transmission-remote"  "${D}/usr/bin" || die "install failed"
install    -o root -g root -m 0755 "build/utils/transmission-show"    "${D}/usr/bin" || die "install failed"
install    -o root -g root -m 0755 "build/daemon/transmission-daemon" "${D}/usr/sbin" || die "install failed"
ln -s "transmission-daemon" "${D}/usr/sbin/p2pd"
}
#############
