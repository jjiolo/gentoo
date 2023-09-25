#############
EAPI=8
#############
DESCRIPTION="Flexible DNS proxy, with support for encrypted DNS protocols"
HOMEPAGE="https://github.com/DNSCrypt/dnscrypt-proxy"
SRC_URI="https://github.com/DNSCrypt/dnscrypt-proxy/archive/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="Apache-2.0 BSD ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="dev-lang/go"
#############
src_configure(){ default ; }
#############
src_compile(){ go build -C dnscrypt-proxy || die "compile failed" ; }
#############
src_install(){

 install -d -o 0 -g 0 -m 0755 "${D}/sbin"

 install -o 0 -g 0 -m 0755 "dnscrypt-proxy/dnscrypt-proxy" "${D}/sbin/dnscrypt-proxy" || die "install failed"

}
#############
