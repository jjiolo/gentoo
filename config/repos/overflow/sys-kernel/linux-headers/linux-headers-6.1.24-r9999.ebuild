#############
EAPI=8
#############
DESCRIPTION="linux headers"
HOMEPAGE="https://www.kernel.org"
SRC_URI="https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${PV}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-devel/bc
dev-libs/elfutils
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/linux-${PV}"
#############
src_configure(){ true ; }
#############
src_compile(){ true ; }
#############
src_install(){

 install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/src"

 cp -rv "${S}" "${D}/usr/src"

 ln -s "linux-${PV}" "${D}/usr/src/linux"


 install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/include"

 make ARCH=x86 ${MAKEOPTS} headers || die 'compile failed'

 find usr/include -type d -mindepth 1 -maxdepth 1 -exec cp -rv {} ${D}/usr/include \;

 find ${D}/usr/include -type d -exec chmod 0755 {} \;

 find ${D}/use/include -type f -exec chmod 0644 {} \;

}
#############
