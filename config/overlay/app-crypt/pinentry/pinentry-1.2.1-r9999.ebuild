#############
EAPI=7
#############
DESCRIPTION="Simple passphrase entry dialogs which utilize the Assuan protocol"
HOMEPAGE="https://gnupg.org/aegypten2/index.html"
SRC_URI="https://gnupg.org/ftp/gcrypt/pinentry/${P}.tar.bz2"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libassuan
dev-libs/libgpg-error
sys-libs/glibc
"
DEPEND="${RDEPEND}"
#############
src_configure() {
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--disable-maintainer-mode \
--disable-pinentry-curses \
--disable-fallback-curses \
--disable-ncurses \
--enable-pinentry-tty \
--disable-rpath \
--disable-pinentry-emacs \
--disable-inside-emacs \
--disable-pinentry-efl \
--disable-pinentry-gtk2 \
--disable-pinentry-gnome3 \
--disable-libsecret \
--disable-pinentry-qt \
--disable-pinentry-qt5 \
--disable-pinentry-qt4 \
--disable-pinentry-tqt \
--disable-pinentry-fltk \
--disable-doc \
\
--without-libgpg-error-prefix \
--without-libassuan-prefix \
--without-ncurses-include-dir \
--with-gnu-ld \
--without-libiconv-prefix
}
#############
src_install() {
install -d -o root -g root -m 0755 "${D}/bin"
install    -o root -g root -m 0755 "tty/pinentry-tty" "${D}/bin/pinentry" || die "install failed"
}
#############
