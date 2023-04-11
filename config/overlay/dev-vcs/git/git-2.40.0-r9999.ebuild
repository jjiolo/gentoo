#############
EAPI=8
#############
DESCRIPTION="stupid content tracker: distributed VCS designed for speed and efficiency"
HOMEPAGE="https://www.git-scm.com/"
SRC_URI="https://mirrors.edge.kernel.org/pub/software/scm/git/${P}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/openssl
net-misc/curl
sys-libs/glibc
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){

sed -i '4i\ NO_GITWEB=YesPlease' Makefile

sed -i '4i\ NO_PERL=YesPlease' Makefile
sed -i '4i\ NO_PYTHON=YesPlease' Makefile
sed -i '4i\ NO_TCLTK=YesPlease' Makefile

sed -i '4i\ NO_ICONV=YesPlease' Makefile
sed -i '4i\ NO_GETTEXT=YesPlease' Makefile
sed -i '4i\ NO_PTHREADS=YesPlease' Makefile

sed -i '4i\ NO_REGEX=YesPlease' Makefile
sed -i '4i\ NO_LIBPCRE2=YesPlease' Makefile
sed -i '4i\ NO_SVN_TESTS=YesPlease' Makefile

sed -i '4i\ INSTALL_SYMLINKS=YesPlease' Makefile
sed -i '4i\ SKIP_DASHED_BUILT_INS=YesPlease' Makefile

sed -i 's/DIFF = diff/DIFF = \/usr\/bin\/diff/' Makefile
sed -i 's/TAR = tar/TAR = \/bin\/tar/' Makefile
sed -i 's/FIND = find/FIND = \/usr\/bin\/find/' Makefile

# --disable-jsmin \
# --disable-cssmin \

./configure \
--prefix=/usr \
--libexec=/usr/libexec \
--enable-option-checking \
--disable-pthreads \
\
\
\
--with-sane-tool-path= \
--with-lib= \
--without-openssl \
--without-libpcre \
--without-libpcre2 \
--without-curl \
--without-expat \
--without-iconv \
--with-gitconfig=/etc/gitconfig \
--with-gitattributes=/etc/gitattributes \
--with-pager=less \
--with-editor=vim \
--with-shell=/bin/sh \
--with-perl \
--without-python \
--with-zlib \
--without-tcltk

}
#############
src_install(){ default ; rm -rf "${D}/usr/share/doc" "${D}/usr/share/locale" ; }
#############
