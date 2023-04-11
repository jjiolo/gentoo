#############
EAPI=8
#############
DESCRIPTION="vim hard dependency in console and desktop"
HOMEPAGE=""
SRC_URI="https://github.com/vim/vim/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="vim"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-libs/glibc
sys-libs/ncurses
"
DEPEND=""
#############
src_configure(){
printf '%s\n' '#define SYS_VIMRC_FILE "/etc/vim/vimrc"' >> "${S}/src/feature.h"
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-fail-if-missing \
--disable-darwin \
--disable-smack \
--disable-selinux \
--disable-xsmp \
--disable-xsmp-interact \
--disable-luainterp \
--disable-mzschemeinterp \
--disable-perlinterp \
--disable-pythoninterp \
--disable-python3interp \
--disable-tclinterp \
--disable-rubyinterp \
--disable-cscope \
--disable-netbeans \
--disable-channel \
--disable-terminal \
--disable-autoservername \
--enable-multibyte \
--disable-rightleft \
--disable-arabic \
--disable-farsi \
--disable-xim \
--disable-fontset \
--disable-gui \
--disable-gtk2-check \
--disable-gnome-check \
--disable-gtk3-check \
--disable-motif-check \
--disable-gtktest \
--disable-icon-cache-update \
--disable-desktop-database-update \
--enable-largefile \
--disable-canberra \
--disable-libsodium \
--disable-acl \
--disable-gpm \
--disable-sysmouse \
--disable-nls \
\
--without-mac-arch \
--without-developer-dir \
--without-local-dir \
--with-vim-name=vim \
--with-ex-name=ex \
--with-view-name=view \
--without-global-runtime \
--without-modified-by \
--with-features=normal \
--without-compiledby \
--without-lua-prefix \
--without-luajit \
--without-plthome \
--without-python-command \
--without-python-config-dir \
--without-python3-command \
--without-python3-config-dir \
--without-tclsh \
--without-ruby-command \
--without-x \
--without-gnome-includes \
--without-gnome-libs \
--without-gnome \
--without-motif-lib \
--with-tlib=
}
#############
src_install(){ default ; }
#############
