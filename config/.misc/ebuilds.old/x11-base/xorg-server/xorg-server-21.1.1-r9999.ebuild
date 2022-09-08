#############
EAPI="8"
#############
DESCRIPTION="gafawww"
HOMEPAGE=""
SRC_URI=""
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
app-crypt/libmd
dev-libs/libbsd
dev-libs/libudev-zero
dev-libs/openssl
sys-devel/gcc
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
DEPEND="${RDEPEND}"
#############
src_configure(){

meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Ddebug=false \
-Ddefault_library=both \
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \
\
-Dagp=false \
-Dapple-application-name=X11 \
-Dapple-applications-dir=/Applications/Utilities \
-Dbuilder_addr=xorg@lists.freedesktop.org \
-Dbuilder_string= \
-Dbundle-id-prefix=org.x \
-Ddefault_font_path= \
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
-Dfallback_input_driver=auto \
-Dglamor=false \
-Dglx=false \
-Dhal=false \
-Dinput_thread=false \
-Dint10=auto \
-Dipv6=true \
-Dlibunwind=false \
-Dlinux_acpi=false \
-Dlinux_apm=false \
-Dlisten_local=true \
-Dlisten_tcp=false \
-Dlisten_unix=false \
-Dlog_dir=/var/run/logs \
-Dmitshm=false \
-Dmodule_dir=/usr/lib64/xorg/modules \
-Dpciaccess=true \
-Dscreensaver=false \
-Dsecure-rpc=false \
-Dsha1=libcrypto \
-Dsparkle-feed-url= \
-Dsuid_wrapper=false \
-Dsystemd_logind=false \
-Dudev=true \
-Dudev_kms=true \
-Dvendor_name='The X.Org Foundation' \
-Dvendor_name_short=X.Org \
-Dvendor_web=http://wiki.x.org \
-Dvgahw=false \
-Dxace=false \
-Dxcsecurity=false \
-Dxdm-auth-1=false \
-Dxdmcp=false \
-Dxephyr=true \
-Dxf86-input-inputtest=false \
-Dxf86bigfont=false \
-Dxinerama=true \
\
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
#-Dxkb_bin_dir=
#-Dxkb_default_layout=
#-Dxkb_default_model=
#-Dxkb_default_options=
#-Dxkb_default_rules=
#-Dxkb_default_variant=
#-Dxkb_dir=
#-Dxkb_output_dir=
#############
src_install(){ default ; }
#############
