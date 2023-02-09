#############
EAPI="7"
#############
DESCRIPTION="Firefox Web Browser"
HOMEPAGE="https://www.mozilla.org"
SRC_URI="https://archive.mozilla.org/pub/firefox/releases/${PV}esr/linux-x86_64/en-US/${P/-esr}esr.tar.bz2"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-accessibility/at-spi2-core
dev-libs/dbus-glib
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/libffi
dev-libs/libpcre2
media-libs/alsa-lib
media-libs/fontconfig
media-libs/freetype
media-libs/harfbuzz
media-libs/libepoxy
media-libs/libpng
media-sound/apulse
sys-apps/dbus
sys-libs/glibc
sys-libs/zlib
x11-libs/cairo
x11-libs/gdk-pixbuf
x11-libs/gtk+
x11-libs/libX11
x11-libs/libXau
x11-libs/libXcomposite
x11-libs/libXcursor
x11-libs/libXdamage
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libXfixes
x11-libs/libXi
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libXtst
x11-libs/libxcb
x11-libs/pango
x11-libs/pixman
x11-misc/shared-mime-info
"
DEPEND="${RDEPEND}"
S="${WORKDIR}/firefox"
#############
src_install(){

 install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/lib64"
 cp -a "${WORKDIR}/firefox" "${D}/usr/lib64" || die "install failed"

 install -d -o root -g root -m 0755 "${D}/usr/lib64/firefox/distribution"
 install    -o root -g root -m 0644 "${FILESDIR}/policies.json" "${D}/usr/lib64/firefox/distribution"
 install    -o root -g root -m 0755 "${FILESDIR}/autoconfig.js" "${D}/usr/lib64/firefox/defaults/pref"
 install    -o root -g root -m 0755 "${FILESDIR}/firefox.cfg" "${D}/usr/lib64/firefox"
 install    -o root -g root -m 0755 "${FILESDIR}/proxy.pac" "${D}/usr/lib64/firefox"

 install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
 ln -s /usr/lib64/firefox/firefox-bin "${D}/usr/bin/firefox"

}
#############
