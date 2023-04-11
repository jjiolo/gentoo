#############
EAPI=8
#############
DESCRIPTION="simple terminal implementation for X"
HOMEPAGE="https://st.suckless.org/"
SRC_URI="https://dl.suckless.org/${PN}/${P}.tar.gz"
#############
LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/expat
dev-libs/libbsd
media-libs/fontconfig
media-libs/freetype
media-libs/libpng
sys-libs/glibc
sys-libs/zlib
x11-libs/libX11
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libXft
x11-libs/libXrender
x11-libs/libxcb
media-fonts/liberation-fonts
"
DEPEND="${RDEPEND}"
#############
src_configure() {
cp "${FILESDIR}/config.h" "${S}";
sed -i 's/it#8,/it#2,/' st.info
}
#############
src_install() {
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install -d -o root -g root -m 0755 "${D}/etc" "${D}/etc/terminfo"
install    -o root -g root -m 0755 "st" "${D}/usr/bin" || die "install failed"
[ -f /usr/bin/tic ] && tic -o "${D}/etc/terminfo" -sx st.info
[ -f /usr/bin/x86_64-pc-linux-gnu-tic ] && x86_64-pc-linux-gnu-tic -o "${D}/etc/terminfo" -sx st.info
}
#############
