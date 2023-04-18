#############
EAPI=8
#############
DESCRIPTION="A Tool for network monitoring and data acquisition"
HOMEPAGE="https://tcpdump.org"
SRC_URI="https://www.tcpdump.org/release/${P}.tar.gz"
#############
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="
${RDEPEND}
net-libs/libpcap
sys-libs/glibc[static-libs]
"
#############
src_configure(){
LDFLAGS=-static ./configure \
--prefix=/usr \
--enable-option-checking \
--disable-universal \
--disable-smb \
--disable-local-libpcap \
\
--with-gcc \
--without-smi \
--with-user=tcpdump \
--with-chroot=/var/empty \
--without-sandbox-capsicum \
--without-crypto \
--without-cap-ng
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "tcpdump" "${D}/sbin"
}
#############
