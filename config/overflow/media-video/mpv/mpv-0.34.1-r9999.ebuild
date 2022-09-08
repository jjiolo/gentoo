#############
EAPI=7
#############
DESCRIPTION="Media player based on MPlayer and mplayer2"
HOMEPAGE="https://mpv.io/ https://github.com/mpv-player/mpv"
SRC_URI="https://github.com/mpv-player/mpv/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz" SRC_URI="${SRC_URI} https://waf.io/waf-2.0.22"
#############
LICENSE="LGPL-2.1+ GPL-2+ BSD ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/libbsd
dev-libs/libpcre
media-libs/alsa-lib
media-libs/fontconfig
media-libs/freetype
media-libs/harfbuzz
media-libs/libass
media-libs/libpng
media-video/ffmpeg
sys-libs/glibc
sys-libs/zlib
x11-libs/libX11
x11-libs/libXScrnSaver
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libXext
x11-libs/libXinerama
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libxcb
"
DEPEND="${RDEPEND}"
#############
src_configure() {

install -o portage -g portage -m 0755 "${DISTDIR}/waf"* "${S}/waf" || die

./waf configure \
--progress \
--targets= \
--variant= \
--disable-lgpl \
--enable-cplayer \
--disable-libmpv-shared \
--disable-libmpv-static \
--disable-static-build \
--disable-build-date \
--disable-optimize \
--disable-debug-build \
--disable-tests \
--disable-ta-leak-report \
--disable-manpage-build \
--disable-html-build \
--disable-pdf-build \
--disable-cplugins \
--disable-asm \
--disable-vector \
--disable-clang-database \
--disable-swift-static \
\
\
\
--prefix=/usr \
--destdir= \
--exec-prefix=/usr \
\
--sysconfdir=/etc \
\
--disable-android \
--disable-tvos \
--disable-egl-android \
--disable-swift \
--disable-uwp \
--disable-win32-internal-pthreads \
--disable-pthread-debug \
--disable-stdatomic \
--disable-iconv \
--disable-lua \
--disable-javascript \
--disable-zlib \
--disable-libbluray \
--disable-dvdnav \
--disable-cdda \
--disable-uchardet \
--disable-rubberband \
--disable-zimg \
--disable-lcms2 \
--disable-vapoursynth \
--disable-libarchive \
--disable-dvbin \
--disable-sdl2 \
--disable-sdl2-gamepad \
--disable-libavdevice \
--lua= \
--swift-flags= \
\
--disable-sdl2-audio \
--disable-oss-audio \
--disable-pulse \
--disable-jack \
--disable-openal \
--disable-opensles \
--enable-alsa \
--disable-coreaudio \
--disable-audiounit \
--disable-wasapi \
\
--disable-sdl2-video \
--disable-cocoa \
--disable-drm \
--disable-gbm \
--disable-wayland-scanner \
--disable-wayland-protocols \
--disable-wayland \
--enable-x11 \
--disable-xv \
--disable-gl-cocoa \
--disable-gl-x11 \
--disable-rpi \
--disable-egl \
--disable-egl-x11 \
--disable-egl-drm \
--disable-gl-wayland \
--disable-gl-win32 \
--disable-gl-dxinterop \
--disable-egl-angle \
--disable-egl-angle-lib \
--disable-egl-angle-win32 \
--disable-vdpau \
--disable-vdpau-gl-x11 \
--disable-vaapi \
--disable-vaapi-x11 \
--disable-vaapi-wayland \
--disable-vaapi-drm \
--disable-vaapi-x-egl \
--disable-caca \
--disable-jpeg \
--disable-direct3d \
--disable-shaderc \
--disable-spirv-cross \
--disable-d3d11 \
--disable-ios-gl \
--disable-plain-gl \
--disable-gl \
--disable-libplacebo \
--disable-vulkan \
--disable-sixel \
\
--disable-videotoolbox-gl \
--disable-d3d-hwaccel \
--disable-d3d9-hwaccel \
--disable-gl-dxinterop-d3d9 \
--disable-cuda-hwaccel \
--disable-cuda-interop \
--disable-rpi-mmal \
\
--disable-macos-touchbar \
--disable-macos-10-11-features \
--disable-macos-10-12-2-features \
--disable-macos-10-14-features \
--disable-macos-media-player \
--disable-macos-cocoa-cb

}
#############
src_compile(){ ./waf build ; }
#############
src_install(){ ./waf --destdir="${D}" install ; }
#############

