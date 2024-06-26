#############
EAPI=8
#############
DESCRIPTION="PulseAudio emulation for ALSA"
HOMEPAGE="https://github.com/i-rinat/apulse"
SRC_URI="https://github.com/i-rinat/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="MIT LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND="${RDEPEND}"
RDEPEND="
dev-libs/glib
dev-libs/libpcre2
media-libs/alsa-lib
sys-libs/glibc
"
#############
src_configure(){
cmake \
-DAPULSEPATH=/usr/lib64/apulse \
-DAPULSE_SEARCH_PATHS=/usr/lib64/apulse \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DLOG_TO_STDERR=0 \
-DUSE_BUNDLED_PULSEAUDIO_HEADERS=1 \
-DWITH_TRACE=0
}
#############
src_install(){ default ; }
#############
