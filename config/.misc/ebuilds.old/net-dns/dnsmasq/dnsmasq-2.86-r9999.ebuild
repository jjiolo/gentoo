#############
EAPI=7
#############
DESCRIPTION="Small forwarding DNS server"
HOMEPAGE="https://www.thekelleys.org.uk/dnsmasq/doc.html"
SRC_URI="https://www.thekelleys.org.uk/dnsmasq/${P}.tar.xz"
#############
LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="sys-libs/glibc[static-libs]"
#############
src_compile(){ make PREFIX=/usr LDFLAGS=-static ${MAKEOPTS} COPTS="-DNO_AUTH -DNO_DHCP -DNO_DHCP6 -DNO_DUMPFILE -DNO_GMP -DNO_ID -DNO_INOTIFY -DNO_IPSET -DNO_LARGEFILE -DNO_LOOP -DNO_SCRIPT -DNO_TFTP" ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "src/dnsmasq" "${D}/sbin" || die "install failed"
}
#############
