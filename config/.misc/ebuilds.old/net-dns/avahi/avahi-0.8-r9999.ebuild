#############
EAPI="7"
#############
DESCRIPTION="System which facilitates service discovery on a local network"
HOMEPAGE="https://avahi.org/"
SRC_URI="https://avahi.org/download/${P}.tar.gz"
#############
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/expat
dev-libs/libdaemon
sys-auth/nss-mdns
sys-libs/glibc
sys-libs/libcap
"
DEPEND="${RDEPEND}"
#############
src_configure(){
./autogen.sh
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--sysconfdir=/etc \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-stack-protector \
--disable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--disable-nls \
--disable-rpath \
--disable-glib \
--disable-gobject \
--enable-introspection=no \
--disable-libevent \
--disable-qt3 \
--disable-qt4 \
--disable-qt5 \
--disable-gtk \
--disable-gtk3 \
--disable-dbus \
--disable-dbm \
--disable-gdbm \
--enable-libdaemon \
--disable-python \
--disable-pygobject \
--disable-python-dbus \
--disable-mono \
--disable-monodoc \
--disable-autoipd \
--disable-doxygen-doc \
--disable-doxygen-dot \
--disable-doxygen-man \
--disable-doxygen-rtf \
--disable-doxygen-xml \
--disable-doxygen-chm \
--disable-doxygen-chi \
--disable-doxygen-html \
--disable-doxygen-ps \
--disable-doxygen-pdf \
--disable-core-docs \
--disable-manpages \
--disable-xmltoman \
--disable-tests \
--disable-compat-libdns_sd \
--disable-compat-howl \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--with-distro=gentoo \
--with-gnu-ld \
--without-libiconv-prefix \
--without-libintl-prefix \
--without-dbus-sys \
--without-dbus-system-address \
--with-xml=expat \
--without-python-sys-prefix \
--without-python_prefix \
--without-python_exec_prefix \
--with-avahi-user=ddns \
--with-avahi-group=ddns \
--with-avahi-priv-access-group=ddns \
--with-autoipd-user=ddns \
--with-autoipd-group=ddns \
--without-systemdsystemunitdir
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "avahi-daemon/avahi-daemon" "${D}/sbin" || die "install failed"
}
#############
