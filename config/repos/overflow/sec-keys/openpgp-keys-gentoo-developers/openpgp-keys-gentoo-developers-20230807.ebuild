#############
EAPI=8
#############
DESCRIPTION="Gentoo Authority Keys (GLEP 79)"
HOMEPAGE="https://www.gentoo.org/downloads/signatures/"
SRC_URI="https://qa-reports.gentoo.org/output/keys/active-devs-${PV}.gpg"
#############
LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}"
#############
src_configure(){ default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/share" "${D}/usr/share/openpgp-keys"
install    -o root -g root -m 0644 "${DISTDIR}/active-devs-${PV}.gpg" "${D}/usr/share/openpgp-keys/active-devs.gpg" || die "install failed"
}
#############
