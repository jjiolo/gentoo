#############
EAPI=8
#############
DESCRIPTION="Library providing generic access to the PCI bus and devices"
HOMEPAGE="https://www.x.org"
SRC_URI="https://www.x.org/releases/individual/lib/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--enable-selective-werror \
--disable-strict-compilation \
--disable-linux-rom-fallback \
--enable-largefile \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-pciids-path \
--without-zlib
}
#############
src_install(){ default ; }
#############

