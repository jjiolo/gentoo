#############
EAPI=8
#############
DESCRIPTION="X.Org X servers"
HOMEPAGE="https://x.org"
SRC_URI="https://www.x.org/releases/individual/xserver/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64"
IUSE="+xorg"
RDEPEND="
app-crypt/libmd
dev-libs/libbsd
dev-libs/libudev-zero
sys-libs/glibc
sys-libs/zlib
x11-libs/libXau
x11-libs/libXdmcp
x11-libs/libXfont2
x11-libs/libdrm
x11-libs/libfontenc
x11-libs/libpciaccess
x11-libs/libxcb
x11-libs/libxcvt
x11-libs/pixman
x11-libs/xcb-util
x11-libs/xcb-util-image
x11-libs/xcb-util-keysyms
x11-libs/xcb-util-renderutil
x11-libs/xcb-util-wm
"
DEPEND="
x11-apps/xkbcomp
x11-libs/libxkbfile
${RDEPEND}
"
#############
src_configure(){
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
-Dagp=false \
-Dapple-application-name= \
-Dapple-applications-dir= \
-Dbuilder_addr= \
-Dbuilder_string= \
-Dbundle-id-prefix= \
-Dbundle-version= \
-Dbundle-version-string= \
-Ddefault_font_path=/usr/share/fonts \
-Ddevel-docs=false \
-Ddga=false \
-Ddocs=false \
-Ddocs-pdf=false \
-Ddpms=false \
-Ddri1=false \
-Ddri2=false \
-Ddri3=false \
-Ddrm=false \
-Ddtrace=false \
-Dfallback_input_driver= \
-Dglamor=false \
-Dglx=false \
-Dhal=false \
-Dinput_thread=false \
-Dint10=false \
-Dipv6=true \
-Dlibunwind=false \
-Dlinux_acpi=false \
-Dlinux_apm=false \
-Dlisten_local=true \
-Dlisten_tcp=true \
-Dlisten_unix=true \
-Dlog_dir=/tmp \
-Dmitshm=true \
-Dmodule_dir=/usr/lib64/xorg/modules \
-Dpciaccess=true \
-Dscreensaver=false \
-Dsecure-rpc=false \
-Dsha1=libmd \
-Dsparkle-feed-url= \
-Dsparkle-public-edkey= \
-Dsuid_wrapper=false \
-Dsystemd_logind=false \
-Dudev=true \
-Dudev_kms=true \
-Dvendor_name= \
-Dvendor_name_short= \
-Dvendor_web= \
-Dvgahw=false \
-Dxace=false \
-Dxcsecurity=false \
-Dxdm-auth-1=false \
-Dxdmcp=false \
-Dxephyr=true \
-Dxf86-input-inputtest=false \
-Dxf86bigfont=false \
-Dxinerama=true \
-Dxkb_bin_dir= \
-Dxkb_default_layout=us \
-Dxkb_default_model=pc105 \
-Dxkb_default_options= \
-Dxkb_default_rules=evdev \
-Dxkb_default_variant= \
-Dxkb_dir= \
-Dxkb_output_dir= \
-Dxnest=false \
-Dxorg=true \
-Dxpbproxy=false \
-Dxquartz=false \
-Dxres=false \
-Dxselinux=false \
-Dxv=false \
-Dxvfb=false \
-Dxvmc=false \
-Dxwin=false 
}
#############
src_compile(){ ninja -C build ${MAKEOPTS} || die "compile failed" ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install || die "install failed" ; }
#############

