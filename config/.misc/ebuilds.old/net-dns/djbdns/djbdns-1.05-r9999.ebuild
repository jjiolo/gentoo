#############
EAPI=8
#############
DESCRIPTION="Collection of DNS client/server software"
HOMEPAGE="http://cr.yp.to/djbdns.html"
SRC_URI="http://cr.yp.to/djbdns/${P}.tar.gz"
#############
LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND=""
#############
src_configure(){ sed -i '/gcc/s/$/ -include \/usr\/include\/errno.h/' conf-cc ; }
#############
src_install(){

 install -d -o root -g root -m 0755 "${D}/etc" "${D}/sbin"

 install -o root -g root -m 0755 "tinydns" "${D}/sbin" || die "install failed"
 install -o root -g root -m 0755 "tinydns-conf" "${D}/sbin" || die "install failed"
 install -o root -g root -m 0755 "tinydns-data" "${D}/sbin" || die "install failed"
 install -o root -g root -m 0755 "tinydns-edit" "${D}/sbin" || die "install failed"
 install -o root -g root -m 0755 "tinydns-get" "${D}/sbin" || die "install failed"

}
#############
