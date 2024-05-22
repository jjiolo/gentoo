#############
EAPI=8
#############
DESCRIPTION="nl80211 configuration utility for wireless devices using the mac80211 stack"
HOMEPAGE="https://wireless.wiki.kernel.org/en/users/Documentation/iw"
SRC_URI="https://mirrors.edge.kernel.org/pub/software/network/${PN}/${P}.tar.xz"
#############
LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
DEPEND="sys-libs/glibc dev-libs/libnl"
RDEPEND=""
#############
src_configure(){ default ; }
#############
src_compile(){ make "${MAKEOPTS}" ; }
#############
src_install(){ make DESTDIR="${D}" PREFIX="/usr" install ; }
#############
