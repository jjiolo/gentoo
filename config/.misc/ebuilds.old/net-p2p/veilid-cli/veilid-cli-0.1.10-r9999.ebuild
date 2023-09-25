#############
EAPI=8
#############
DESCRIPTION="open source peer to peer mobile first networked application framework"
HOMEPAGE="https://veilid.com"
SRC_URI="https://packages.veilid.net/apt/pool/main/veilid-cli-${PV}_amd64.deb"
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

 ar x "veilid-cli-${PV}_amd64.deb" ; tar xf "data.tar.xz"

 install -d -o root -g root -m 0755 "${D}/sbin"
 install -o root -g root -m 0755 "usr/bin/veilid-cli" "${D}/sbin/veilid-cli"

}
#############
