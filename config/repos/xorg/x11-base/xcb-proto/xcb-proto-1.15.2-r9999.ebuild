#############
EAPI=8
#############
DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="https://xcb.freedesktop.org"
SRC_URI="https://xcb.freedesktop.org/dist/${P}.tar.xz"
#############
LICENSE="X11 License Distribution Modification Variant"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \

#--without-python-sys-prefix \
#--without-python_prefix \
#--without-python_exec_prefix
}
#############
src_install(){ default ; }
#############

