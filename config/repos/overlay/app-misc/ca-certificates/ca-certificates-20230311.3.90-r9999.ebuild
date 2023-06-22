#############
EAPI=8
#############
DESCRIPTION="Common CA Certificates PEM files"
HOMEPAGE="https://www.ccadb.org"
SRC_URI="https://ccadb-public.secure.force.com/mozilla/IncludedRootsPEMTxt?TrustBitsInclude=Websites -> ca-certificates.crt"
SRC_URI="https://ccadb.my.salesforce-sites.com/mozilla/IncludedRootsPEMTxt?TrustBitsInclude=Websites -> ca-certificates.crt"
#############
LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"
S="${WORKDIR}"
#############
src_install(){

install -d -o root -g root -m 0755 "${D}/etc" "${D}/etc/ssl" "${D}/etc/ssl/certs"
install    -o root -g root -m 0644 "${DISTDIR}/ca-certificates.crt" "${D}/etc/ssl/certs"

awk 'BEGIN {c=0;} /BEGIN CERT/ {c++} { print > "cert." c ".crt" }' < "${DISTDIR}/ca-certificates.crt"

mv cert.* "${D}/etc/ssl/certs"

openssl rehash "${D}/etc/ssl/certs"

}
#############
