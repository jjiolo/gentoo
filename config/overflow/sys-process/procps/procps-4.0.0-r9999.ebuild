#############
EAPI=7
#############
DESCRIPTION="Standard informational utilities and process-handling tools"
HOMEPAGE="https://gitlab.com/procps-ng/procps"
SRC_URI="https://gitlab.com/procps-ng/procps/-/archive/v4.0.0/procps-v4.0.0.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
S="${WORKDIR}/procps-v4.0.0"
#############
src_configure(){
./autogen.sh
LDFLAGS=-static ./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-largefile \
--disable-nls \
--disable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--disable-rpath \
--disable-watch8bit \
--disable-libselinux \
--enable-harden-flags \
--disable-pidof \
--disable-kill \
--disable-w \
--disable-skill \
--disable-examples \
--disable-sigwinch \
--disable-wide-percent \
--disable-wide-memory \
--disable-modern-top \
--disable-numa \
--disable-w-from \
--disable-whining \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-libiconv-prefix \
--without-libintl-prefix \
--without-ncurses \
--without-systemd
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin"
install    -o root -g root -m 0755 "ps/pscommand" "${D}/bin/ps" || die "install failed"
}
#############
