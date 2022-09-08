#############
EAPI="8"
#############
DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/archive/xf86-input-mouse-1.9.0/xf86-input-mouse-xf86-input-mouse-1.9.0.tar.gz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}/xf86-input-mouse-xf86-input-mouse-1.9.0"
#############
src_configure(){
./autogen.sh
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--enable-static \
--enable-shared \
--disable-fast-install \
--disable-dependency-tracking \
--enable-libtool-lock \
--disable-selective-werror \
--disable-strict-compilation \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-lint \
--with-xorg-module-dir=/usr/lib64/xorg/modules
}
#############
src_install(){ default ; }
#############
