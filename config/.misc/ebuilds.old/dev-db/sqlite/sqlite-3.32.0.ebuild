#############
EAPI="7"
#############
DESCRIPTION="SQL database engine"
HOMEPAGE="https://sqlite.org/"
SRC_URI=""
#############
LICENSE="public-domain"
SLOT="3"
KEYWORDS=""
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--enable-option-checking \
--disable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--enable-largefile \
--disable-threadsafe \
--enable-releasemode \
--disable-tempstore \
--disable-tcl \
--disable-editline \
--disable-readline \
--disable-debug \
--disable-amalgamation \
--disable-load-extension \
--disable-memsys5 \
--disable-memsys3 \
--disable-all \
--disable-fts3 \
--disable-fts4 \
--disable-fts5 \
--disable-json1 \
--disable-update-limit \
--disable-geopoly \
--disable-rtree \
--disable-session \
--disable-gcov \
\
--with-pic \
--with-gnu-ld \
--without-tcl \
--without-readline-lib \
--without-readline-inc
}
#############
src_install(){ default ; }
#############

