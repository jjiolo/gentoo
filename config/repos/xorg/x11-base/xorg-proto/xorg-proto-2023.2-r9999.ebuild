#############
EAPI=8
#############
DESCRIPTION="X.Org combined protocol headers"
HOMEPAGE="https://x.org"
SRC_URI="https://x.org/releases/individual/proto/${PN//-}-${PV}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND=""
S="${WORKDIR}/${PN//-}-${PV}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-selective-werror \
--disable-strict-compilation \
--disable-specs \
--disable-legacy \
\
--without-xmlto \
--without-fop \
--without-xsltproc \
--without-python-sys-prefix \
--without-python_prefix \
--without-python_exec_prefix
}
#############
src_install(){ default ; }
#############

