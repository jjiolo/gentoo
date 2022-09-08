#############
EAPI=7
#############
DESCRIPTION="Bluetooth Tools and System Daemons for Linux"
HOMEPAGE="http://www.bluez.org"
SRC_URI="https://www.kernel.org/pub/linux/bluetooth/${P}.tar.xz"
#############
LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0/3"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${DEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-maintainer-mode \
--disable-dependency-tracking \
--enable-static \
--enable-shared \
--enable-fast-install \
--enable-libtool-lock \
--enable-optimization \
--disable-debug \
--enable-pie \
--disable-threads \
--disable-backtrace \
--disable-library \
--disable-test \
--disable-nfc \
--disable-sap \
--disable-a2dp \
--disable-avrcp \
--disable-network \
--disable-hid \
--disable-hog \
--disable-health \
--disable-tools \
--disable-monitor \
--disable-udev \
--disable-cups \
--disable-mesh \
--disable-midi \
--disable-obex \
--disable-btpclient \
--disable-external-ell \
--enable-client \
--disable-systemd \
--disable-datafiles \
--disable-manpages \
--disable-testing \
--disable-experimental \
--disable-deprecated \
--disable-sixaxis \
--disable-logger \
--disable-android \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-dbusconfdir \
--without-dbussystembusdir \
--without-dbussessionbusdir \
--without-zsh-completion-dir \
--without-udevdir \
--without-systemdsystemunitdir \
--without-systemduserunitdir
}
#############
src_install(){ true; }
#############
