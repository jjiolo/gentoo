#############
EAPI=8
#############
DESCRIPTION="Media player based on MPlayer and mplayer2"
HOMEPAGE="https://mpv.io/ https://github.com/mpv-player/mpv"
SRC_URI="https://github.com/mpv-player/mpv/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="LGPL-2.1+ GPL-2+ BSD ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/fribidi
dev-libs/glib
dev-libs/libpcre2
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
x11-libs/libXfixes
x11-libs/libXinerama
x11-libs/libXpresent
x11-libs/libXrandr
x11-libs/libXrender
x11-libs/libxcb
"
DEPEND="${RDEPEND}"
#############
src_configure() {
meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Ddebug=false \
-Ddefault_library=both \
-Dprefer_static=false \
-Dwerror=false \
\
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \
\
-Dalsa=enabled \
-Dandroid-media-ndk=disabled \
-Daudiounit=disabled \
-Dbuild-date=false \
-Dcaca=disabled \
-Dcdda=disabled \
-Dcocoa=disabled \
-Dcoreaudio=disabled \
-Dcplayer=true \
-Dcplugins=disabled \
-Dcuda-hwaccel=disabled \
-Dcuda-interop=disabled \
-Dd3d-hwaccel=disabled \
-Dd3d11=disabled \
-Dd3d9-hwaccel=disabled \
-Ddirect3d=disabled \
-Ddmabuf-wayland=disabled \
-Ddrm=disabled \
-Ddvbin=disabled \
-Ddvdnav=disabled \
-Degl=disabled \
-Degl-android=disabled \
-Degl-angle=disabled \
-Degl-angle-lib=disabled \
-Degl-angle-win32=disabled \
-Degl-drm=disabled \
-Degl-wayland=disabled \
-Degl-x11=disabled \
-Dgbm=disabled \
-Dgl=disabled \
-Dgl-cocoa=disabled \
-Dgl-dxinterop=disabled \
-Dgl-dxinterop-d3d9=disabled \
-Dgl-win32=disabled \
-Dgl-x11=disabled \
-Dgpl=true \
-Dhtml-build=disabled \
-Diconv=disabled \
-Dios-gl=disabled \
-Djack=disabled \
-Djavascript=disabled \
-Djpeg=disabled \
-Dlcms2=disabled \
-Dlibarchive=disabled \
-Dlibavdevice=disabled \
-Dlibbluray=disabled \
-Dlibmpv=false \
-Dlibplacebo=disabled \
-Dlibplacebo-next=disabled \
-Dlua=disabled \
-Dmacos-10-11-features=disabled \
-Dmacos-10-12-2-features=disabled \
-Dmacos-10-14-features=disabled \
-Dmacos-cocoa-cb=disabled \
-Dmacos-media-player=disabled \
-Dmacos-touchbar=disabled \
-Dmanpage-build=disabled \
-Dopenal=disabled \
-Dopensles=disabled \
-Doss-audio=disabled \
-Dpdf-build=disabled \
-Dpipewire=disabled \
-Dplain-gl=disabled \
-Dpthread-debug=disabled \
-Dpulse=disabled \
-Drpi=disabled \
-Drpi-mmal=disabled \
-Drubberband=disabled \
-Dsdl2=disabled \
-Dsdl2-audio=disabled \
-Dsdl2-gamepad=disabled \
-Dsdl2-video=disabled \
-Dshaderc=disabled \
-Dsixel=disabled \
-Dsndio=disabled \
-Dspirv-cross=disabled \
-Dstdatomic=disabled \
-Dswift-build=disabled \
-Dswift-flags=disabled \
-Dta-leak-report=false \
-Dtests=false \
-Duchardet=disabled \
-Duwp=disabled \
-Dvaapi=disabled \
-Dvaapi-drm=disabled \
-Dvaapi-wayland=disabled \
-Dvaapi-x-egl=disabled \
-Dvaapi-x11=disabled \
-Dvapoursynth=disabled \
-Dvdpau=disabled \
-Dvdpau-gl-x11=disabled \
-Dvector=disabled \
-Dvideotoolbox-gl=disabled \
-Dvulkan=disabled \
-Dvulkan-interop=disabled \
-Dwasapi=disabled \
-Dwayland=disabled \
-Dwin32-internal-pthreads=disabled \
-Dx11=enabled \
-Dxv=disabled \
-Dzimg=disabled \
-Dzlib=disabled
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin"
install    -o root -g root -m 0755 "build/mpv" "${D}/usr/bin" || die "install failed"
}
#############

