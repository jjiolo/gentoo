#############
EAPI="8"
#############
DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://gitlab.freedesktop.org/xorg/driver/xf86-input-keyboard/-/archive/xf86-input-keyboard-1.9.0/xf86-input-keyboard-xf86-input-keyboard-1.9.0.tar.gz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}/xf86-input-keyboard-xf86-input-keyboard-1.9.0"
#############
src_configure(){
./autogen.sh
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-fast-install \
--disable-dependency-tracking \
--enable-libtool-lock \
--enable-selective-werror \
--disable-strict-compilation \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--with-xorg-module-dir=/usr/lib64/xorg/modules
}
#############
src_install(){ default ; }
#############
