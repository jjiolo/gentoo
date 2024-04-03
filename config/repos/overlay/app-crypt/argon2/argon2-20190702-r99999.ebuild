#############
EAPI=8
#############
DESCRIPTION="Password hashing software that won the Password Hashing Competition (PHC)"
HOMEPAGE="https://github.com/P-H-C/phc-winner-argon2"
SRC_URI="https://github.com/P-H-C/phc-winner-argon2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="|| ( Apache-2.0 CC0-1.0 )"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
S="${WORKDIR}/phc-winner-${P}"
#############
src_configure(){ default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "argon2" "${D}/usr/bin/argon2" || die "install failed"
}
#############
