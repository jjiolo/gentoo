#############
EAPI=8
#############
DESCRIPTION="X.Org xtrans library"
HOMEPAGE="https://www.x.org"
SRC_URI="https://www.x.org/releases/individual/lib/${P}.tar.xz"
#############
LICENSE=""
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
--disable-dependency-tracking \
--enable-selective-werror \
--disable-strict-compilation \
--disable-docs \
\
--without-xmlto \
--without-fop \
--without-xsltproc
}
#############
src_install(){ default ; }
#############
