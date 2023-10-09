#############
EAPI=8
#############
DESCRIPTION="X C-language Bindings library"
HOMEPAGE="https://xcb.freedesktop.org"
SRC_URI="https://xcb.freedesktop.org/dist/${P}.tar.xz"
#############
LICENSE="X11 License Distribution Modification Variant"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-libs/glibc
x11-libs/libXau
x11-libs/libXdmcp
"
DEPEND="${RDEPEND} x11-base/xcb-proto"
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
--disable-composite \
--disable-damage \
--disable-dbe \
--disable-dpms \
--disable-dri2 \
--disable-dri3 \
--disable-ge \
--disable-glx \
--disable-present \
--enable-randr \
--disable-record \
--enable-render \
--disable-resource \
--disable-screensaver \
--enable-shape \
--enable-shm \
--disable-sync \
--disable-xevie \
--enable-xfixes \
--disable-xfree86-dri \
--disable-xinerama \
--disable-xinput \
--enable-xkb \
--disable-xprint \
--disable-selinux \
--disable-xtest \
--disable-xv \
--disable-xvmc \
\
--without-python-sys-prefix \
--without-python_prefix \
--without-python_exec_prefix \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-doxygen \
--with-queue-size=16384 \
--without-serverside-support
}
#############
src_install(){ default ; }
#############


