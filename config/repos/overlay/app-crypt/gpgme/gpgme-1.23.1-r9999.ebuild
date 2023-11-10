#############
EAPI=8
#############
DESCRIPTION="GnuPG Made Easy is a library for making GnuPG easier to use"
HOMEPAGE="https://www.gnupg.org/related_software/gpgme"
SRC_URI="https://gnupg.org/ftp/gcrypt/gpgme/${P}.tar.bz2"
#############
LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libassuan
dev-libs/libgpg-error
sys-libs/glibc
"
DEPEND="${RDEPEND}"
#############
src_configure() {

./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--disable-maintainer-mode \
--disable-dependency-tracking \
--enable-static \
--enable-shared \
--disable-fast-install \
--enable-libtool-lock \
--disable-glibtest \
--disable-w32-glib \
--enable-fixed-path=/bin \
--disable-no-direct-extern-access \
--disable-languages \
--disable-build-timestamp \
--disable-gpgconf-test \
--disable-gpg-test \
--disable-gpgsm-test \
--disable-g13-test \
--enable-largefile \
--disable-fd-passing \
--disable-linux-getdents \
\
--with-pic \
--with-gnu-ld \
--with-sysroot \
--without-libtool-modification \
--without-python-sys-prefix \
--without-python_prefix \
--without-python_exec_prefix \
--without-libgpg-error-prefix \
--without-libassuan-prefix

}
#############
src_install() { default ; }
#############
