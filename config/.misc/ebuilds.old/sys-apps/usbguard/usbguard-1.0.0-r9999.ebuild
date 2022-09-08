#############
EAPI=7
#############
DESCRIPTION="Daemon protecting your computer against BadUSB"
HOMEPAGE="https://github.com/USBGuard/usbguard"
SRC_URI="https://github.com/USBGuard/usbguard/releases/download/${P}/${P}.tar.gz"
#############
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--disable-coverage \
--enable-werror \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--disable-audit \
--enable-seccomp \
--disable-libcapng \
--disable-umockdev \
--enable-asan \
--enable-tsan \
--disable-full-test-suite \
--disable-debug-build \
--disable-systemd \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-libgcrypt-prefix \
--with-crypto-library=openssl \
--with-bundled-catch \
--with-bundled-pegtl \
--without-dbus \
--without-polkit \
--without-ldap
}
#############
src_install(){ default ; }
#############
