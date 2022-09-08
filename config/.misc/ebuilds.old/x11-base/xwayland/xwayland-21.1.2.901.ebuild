#############
EAPI=7
#############
DESCRIPTION="Standalone X server running under Wayland"
HOMEPAGE="https://wayland.freedesktop.org/xserver.html"
SRC_URI="https://xorg.freedesktop.org/archive/individual/xserver/${P}.tar.xz"
#############
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
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
-Dbuilder_addr= \
-Dbuilder_string= \
-Ddpms=false \
-Ddri3=false \
-Ddtrace=false \
-Dglamor=false \
-Dglx=false \
-Dinput_thread=false \
-Dipv6=false \
-Dlibunwind=false \
-Dlisten_local=true \
-Dlisten_tcp=false \
-Dlisten_unix=false \
-Dmitshm=false \
-Dscreensaver=false \
-Dsecure-rpc=false \
-Dsha1=auto \
-Dvendor_name= \
-Dvendor_name_short= \
-Dvendor_web= \
-Dxace=false \
-Dxcsecurity=false \
-Dxdm-auth-1=false \
-Dxdmcp=false \
-Dxf86bigfont=false \
-Dxinerama=false \
-Dxres=false \
-Dxselinux=false \
-Dxv=false \
-Dxvfb=false \
-Dxwayland_eglstream=false
}
#############
src_compile(){ ninja -C build -j16 -l16 ; }
#############
src_install(){ DESTDIR="${D}" ninja -C build install ; rm "${D}/usr/lib64/xorg/protocol.txt" ; }
#############
