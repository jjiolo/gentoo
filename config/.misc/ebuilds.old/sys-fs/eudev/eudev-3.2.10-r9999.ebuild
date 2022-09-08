#############
EAPI="8"
#############
DESCRIPTION="Linux dynamic and persistent device naming support (aka userspace devfs)"
HOMEPAGE="https://github.com/gentoo/eudev"
SRC_URI="https://github.com/eudev-project/eudev/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz " # SRC_URI="https://dev.gentoo.org/~blueness/${PN}/${P}.tar.gz"
#############
LICENSE="LGPL-2.1 MIT GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--bindir=/bin \
--sysconfdir=/etc \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-largefile \
--disable-dependency-tracking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--disable-split-usr \
--enable-introspection=no \
--enable-programs \
--enable-blkid \
--disable-selinux \
--disable-manpages \
--disable-kmod \
--enable-hwdb \
--disable-rule-generator \
--disable-mtd_probe \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--with-rootprefix= \
--with-rootlibdir=/usr/lib64 \
--with-rootlibexecdir=/lib/udev \
--with-rootrundir=/run
}
#############
src_install(){ default; }
#############
