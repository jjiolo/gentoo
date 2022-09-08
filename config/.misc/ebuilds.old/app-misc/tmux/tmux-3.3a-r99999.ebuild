#############
EAPI="7"
#############
DESCRIPTION="Terminal Multiplexer"
HOMEPAGE="https://tmux.github.io"
SRC_URI="https://github.com/tmux/tmux/releases/download/${P}.tar.gz"
#############
LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="
${RDEPEND}
dev-libs/libevent[static-libs]
sys-libs/glibc[static-libs]
sys-libs/ncurses[static-libs]
"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-fuzzing \
--disable-dependency-tracking \
--disable-debug \
--enable-static \
--disable-utempter \
--disable-utf8proc \
--disable-systemd \
\
--with-TERM=screen-256color
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin"
install    -o root -g root -m 0755 tmux "${D}/bin" || die "install failed"
}
#############
