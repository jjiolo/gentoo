#############
EAPI="8"
#############
DESCRIPTION="attempt thefting alpine"
HOMEPAGE="https://alpine.org"
SRC_URI="https://dl-cdn.alpinelinux.org/alpine/v3.14/main/x86_64/${P}-r0.apk -> ${P}.tar.gz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}"
#############
src_install(){

install -d -o 0 -g 0 -m 0755 "${D}/sbin"

install -o 0 -g 0 -m 0755 "sbin/apk.static" "${D}/sbin/apk"

}
#############
