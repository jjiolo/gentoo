#############
EAPI=8
#############
DESCRIPTION="Linux kernel (3.13+) firewall, NAT and packet mangling tools"
HOMEPAGE="https://netfilter.org/projects/nftables/"
SRC_URI="https://netfilter.org/projects/nftables/files/${P}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
net-libs/libmnl
net-libs/libnftnl
sys-libs/glibc
"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-debug \
--disable-man-doc \
--disable-dependency-tracking \
--enable-static \
--disable-shared \
--disable-fast-install \
--enable-libtool-lock \
--disable-python \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--with-mini-gmp \
--without-cli \
--without-xtables \
--without-json \
--without-python-bin
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "src/nft" "${D}/sbin" || die "install failed"
}
#############
