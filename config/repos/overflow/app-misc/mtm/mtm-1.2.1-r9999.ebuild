#############
EAPI=8
#############
DESCRIPTION="micro terminal multiplexer"
HOMEPAGE="https://github.com/deadpixi/mtm"
SRC_URI="https://github.com/deadpixi/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc sys-libs/ncurses"
DEPEND="${RDEPEND}"
#############
src_configure(){
sed -i '9s/$/ -ltinfow/' Makefile
sed -i 's/$(FEATURES)/-D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=600 -D_XOPEN_SOURCE_EXTENDED/' Makefile
}
#############
src_compile(){ make ${MAKEOPTS} ; }
#############
src_install(){

install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "mtm" "${D}/usr/bin/mtm" || die "install failed"

install -d -o root -g root -m 0755 "${D}/etc" "${D}/etc/terminfo"
[ -f /usr/bin/tic ] && tic -o "${D}/etc/terminfo" -sx mtm.ti
[ -f /usr/bin/x86_64-pc-linux-gnu-tic ] && x86_64-pc-linux-gnu-tic -o "${D}/etc/terminfo" -sx mtm.ti

}
#############
