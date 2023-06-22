#############
EAPI=8
#############
DESCRIPTION="OpenPGP keys used for Gentoo releases (snapshots, stages)"
HOMEPAGE="https://www.gentoo.org/downloads/signatures/"
SRC_URI="https://dev.gentoo.org/~mgorny/dist/openpgp-keys/gentoo-release.asc.${PV}.gz"
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
install    -o root -g root -m 0644 "gentoo-release.asc.${PV}" "${D}/usr/share/openpgp-keys/gentoo-release.asc" || die "install failed"
}
#############
