#############
EAPI="7"
#############
DESCRIPTION="A fast and lightweight web browser running in both graphics and text mode"
HOMEPAGE="http://links.twibright.com/"
SRC_URI="http://links.twibright.com/download/${P}.tar.bz2"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/libbsd
dev-libs/openssl
media-libs/fontconfig
media-libs/freetype
media-libs/libjpeg-turbo
media-libs/libpng
sys-libs/glibc
sys-libs/zlib
x11-libs/libX11
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libxcb
"
DEPEND="${RDEPEND}"
#############
src_configure(){
sed -ie '346,347d' dns.c
./configure \
--prefix=/usr \
--x-includes=/usr/include/xorg \
--x-libraries=/usr/lib64/xorg \
--enable-debuglevel=3 \
--enable-graphics \
--enable-utf8 \
--with-getaddrinfo \
--with-ipv6 \
--without-libevent \
--without-gpm \
--with-ssl \
\
--enable-ssl-pkgconfig \
--with-zlib \
--without-brotli \
--without-zstd \
--without-bzip2 \
--without-lzma \
--without-lzip \
--without-openmp \
--without-svgalib \
\
--without-fb \
--without-directfb \
--without-pmshell \
--without-windows \
--without-atheos \
--without-haiku \
--without-grx \
--with-x \
--without-freetype \
--enable-freetype-pkgconfig \
--enable-png-pkgconfig \
--with-libjpeg \
--without-libtiff \
--without-librsvg \
--enable-svg-pkgconfig \
--without-libwebp \
--enable-webp-pkgconfig
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "links" "${D}/usr/bin" || die "install failed"
}
#############
