#############
EAPI=8
#############
DESCRIPTION="minissdpd miniupnpd miniupnpc" MP="miniupnpd_${PV//./_}"
HOMEPAGE="https://github.com/transmission/${PN}" # https://github.com/miniupnp/miniupnp
SRC_URI="https://github.com/transmission/${PN}/archive/refs/tags/${MP}.tar.gz"
#############
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="dev-build/cmake"
S="${WORKDIR}/miniupnp-${MP}/miniupnpc"
#############
src_configure(){
cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr \
-DNO_GETADDRINFO=OFF \
-DUPNPC_BUILD_SAMPLE=OFF \
-DUPNPC_BUILD_SHARED=ON \
-DUPNPC_BUILD_STATIC=ON \
-DUPNPC_BUILD_TESTS=OFF \
-DUPNPC_NO_INSTALL=OFF
}
#############
src_compile(){ default ; }
#############
src_install(){ default ; }
#############
