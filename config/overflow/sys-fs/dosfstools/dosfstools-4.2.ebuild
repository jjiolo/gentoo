#############
EAPI=7
#############
DESCRIPTION="DOS filesystem tools - provides mkdosfs, mkfs.msdos, mkfs.vfat"
HOMEPAGE="https://github.com/dosfstools/dosfstools"
SRC_URI="https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${P}.tar.gz"
#############
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--enable-compat-symlinks \
--disable-atari-check \
--disable-dependency-tracking \
--enable-largefile \
--disable-rpath \
\
--without-iconv \
--with-gnu-ld \
--without-libiconv-prefix
}
#############
src_install(){ default ; }
#############
