#############
EAPI="7"
#############
DESCRIPTION="transmission bittorrent client"
HOMEPAGE="https://www.transmissionbt.com"
SRC_URI="https://github.com/transmission/transmission/releases/download/4.0.0/transmission-4.0.0.tar.xz"
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
-DENABLE_GTK=OFF \
-DENABLE_MAC=OFF \
-DENABLE_NLS=OFF \
-DENABLE_QT=OFF \
-DENABLE_TESTS=OFF \
-DENABLE_UTILS=ON \
-DENABLE_UTP=ON \
-DENABLE_WEB=OFF \
-DENABLE_WERROR=OFF \
-DINSTALL_DOC=OFF \
-DINSTALL_LIB=OFF \
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
-DWITH_CRYPTO=openssl \
-DWITH_INOTIFY=ON \
-DWITH_SYSTEMD=OFF ..

}
#############
src_compile(){ cd build ; default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install    -o root -g root -m 0755 "build/utils/transmission-create"  "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "build/utils/transmission-show"    "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "build/utils/transmission-edit"    "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "build/utils/transmission-remote"  "${D}/bin" || die "install failed"
install    -o root -g root -m 0755 "build/daemon/transmission-daemon" "${D}/sbin" || die "install failed"
ln -s "/sbin/transmission-daemon" "${D}/sbin/p2pd"
}
#############
