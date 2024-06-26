#############
EAPI=8
#############
DESCRIPTION="Standard EXT2/EXT3/EXT4 filesystem utilities"
HOMEPAGE="https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"
SRC_URI="https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v${PV}/${P}.tar.xz"
#############
LICENSE="GPL-2 BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){

./configure \
--prefix=/usr \
--sysconfdir=/etc \
--enable-option-checking \
--disable-maintainer-mode \
--enable-symlink-install \
--enable-relative-symlinks \
--enable-symlink-build \
--disable-verbose-makecmds \
--disable-elf-shlibs \
--disable-bsd-shlibs \
--disable-profile \
--disable-gcov \
--enable-hardening \
--disable-jbd-debug \
--disable-blkid-debug \
--disable-testio-debug \
--disable-developer-features \
--enable-libuuid \
--disable-libblkid \
--disable-subset \
--disable-backtrace \
--disable-debugfs \
--disable-imager \
--disable-resizer \
--enable-defrag \
--enable-fsck \
--disable-e2initrd-helper \
--disable-tls \
--disable-uuidd \
--disable-mmp \
--disable-tdb \
--disable-bmap-stats \
--disable-bmap-stats-ops \
--disable-nls \
--disable-rpath \
--enable-largefile \
--disable-fuse2fs \
--enable-lto \
--disable-ubsan \
--disable-addrsan \
--disable-threadsan \
--disable-fuzzing \

#--without-diet-libc \
#--without-cc \
#--without-ccopts \
#--without-ldopts \
#--with-root-prefix \
#--without-pthread \
#--with-gnu-ld \
#--without-libiconv-prefix \
#--without-libintl-prefix \
#--without-libarchive \
#--without-multiarch \
#--without-udev-rules-dir \
#--without-crond-dir \
#--without-systemd-unit-dir

}
#############
src_install(){ default ; }
#############
