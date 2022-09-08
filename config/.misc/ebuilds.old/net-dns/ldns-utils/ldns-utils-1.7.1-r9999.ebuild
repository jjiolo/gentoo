#############
EAPI="7"
#############
DESCRIPTION="Set of utilities to simplify various dns(sec) tasks"
HOMEPAGE="http://www.nlnetlabs.nl/projects/ldns/"
SRC_URI="http://www.nlnetlabs.nl/downloads/ldns/${P/-utils}.tar.gz"
#############
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc dev-libs/openssl"
DEPEND=""
S="${WORKDIR}/${P/-utils}"
#############
src_configure(){
./configure\
 --prefix=/usr\
 --disable-shared\
 --enable-static\
 --enable-fast-install\
 --enable-libtool-lock\
 --disable-ldns-config\
 --enable-stderr-msgs\
 --enable-poll\
 --enable-sha2\
 --disable-gost\
 --disable-gost-anyway\
 --enable-ecdsa\
 --disable-dsa\
 --enable-ed25519\
 --disable-ed448\
 --disable-dane\
 --disable-dane-verify\
 --disable-dane-ta-usage\
 --disable-rrtype-ninfo\
 --disable-rrtype-rkey\
 --disable-rrtype-openpgpkey\
 --disable-rrtype-ta\
 --disable-rrtype-avc\
 --disable-rpath\
\
 --with-pic\
 --with-aix-soname=aix\
 --with-gnu-ld\
 --with-drill\
 --without-examples\
 --without-pyldns\
 --without-pyldnsx\
 --without-p5-dns-ldns\
 --with-ssl\
 --with-trust-anchor=/tmp/root.anchors\
 --with-ca-file=/etc/ssl/certs/ca-certificates.crt\
 --with-ca-path=/etc/ssl/certs
}
#############
src_install() {
dodir /usr/bin
cp -a drill/drill "${D}/usr/bin"
}
#############