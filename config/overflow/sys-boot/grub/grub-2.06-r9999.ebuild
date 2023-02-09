#############
EAPI=8
#############
DESCRIPTION="GNU GRUB boot loader"
SRC_URI="https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz"
HOMEPAGE="https://www.gnu.org/software/grub/"
#############
LICENSE="GPL-3+ BSD MIT"
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
--libdir=/usr/lib \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-largefile \
--disable-threads \
--enable-nls \
--disable-rpath \
--disable-efiemu \
--disable-stack-protector \
--disable-mm-debug \
--disable-cache-stats \
--disable-boot-time \
--disable-grub-emu-sdl \
--disable-grub-emu-pci \
--disable-grub-mkfont \
--disable-grub-themes \
--disable-grub-mount \
--disable-device-mapper \
--enable-liblzma \
--disable-libzfs \
--disable-werror \
\
--with-platform=efi \
--with-bootdir=/boot \
--with-grubdir=grub \
--with-gnu-ld \
--without-libiconv-prefix \
--without-libintl-prefix \
--without-libpth-prefix \
--without-included-regex
}
#############
src_install(){ default ; }
#############
