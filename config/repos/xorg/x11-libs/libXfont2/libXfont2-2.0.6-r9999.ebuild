#############
EAPI=8
#############
DESCRIPTION="X.Org Xfont library"
HOMEPAGE="https://www.x.org"
SRC_URI="https://www.x.org/releases/individual/lib/${P}.tar.xz"
#############
LICENSE="BSD-4-Clause (University of California-Specific)"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/libbsd
sys-libs/glibc
sys-libs/zlib
x11-libs/libfontenc
"
DEPEND="${RDEPEND} x11-libs/xtrans"
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
--disable-devel-docs \
--disable-freetype \
--enable-builtins \
--disable-pcfformat \
--disable-bdfformat \
--disable-snfformat \
--disable-fc \
--enable-unix-transport \
--enable-tcp-transport \
--enable-ipv6 \
--enable-local-transport \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-xmlto \
--without-fop \
--without-freetype-config \
--without-bzip2
}
#############
src_install(){ default ; }
#############

