#############
EAPI=7
#############
DESCRIPTION="GNU libc C library"
HOMEPAGE="https://www.gnu.org/software/libc/"
SRC_URI="https://ftp.gnu.org/gnu/glibc/${P}.tar.xz"
#############
LICENSE="LGPL-2.1+ BSD HPND ISC inner-net rc PCRE"
SLOT="2.2"
KEYWORDS="" #amd64"
IUSE="-crypt -vanilla"
RDEPEND=""
DEPEND=""
#############
src_configure(){

sed -ie '108,124d' Makefile

mkdir build

cd build

../configure \
--prefix=/usr \
--enable-option-checking \
--enable-sanity-checks \
--enable-shared \
--disable-profile \
--enable-default-pie \
--disable-timezone-tools \
--disable-hardcoded-path-in-tests \
--enable-hidden-plt \
--enable-bind-now \
--enable-stack-protector=all \
--enable-static-nss \
--disable-force-install \
--disable-maintainer-mode \
--enable-kernel=5.18 \
--disable-all-warnings \
--disable-werror \
--disable-multi-arch \
--disable-experimental-malloc \
--disable-memory-tagging \
--disable-crypt \
--disable-nss-crypt \
--disable-systemtap \
--disable-build-nscd \
--disable-nscd \
--disable-pt_chown \
--disable-tunables \
--disable-mathvec \
--disable-cet \
--disable-scv

#--without-pkgversion \
#--without-bugurl \
#--without-gd \
#--without-gd-include \
#--without-gd-lib \
#--without-binutils \
#--without-selinux \
#--without-headers \
#--without-default-link \
#--without-nonshared-cflags \
#--without-rtld-early-cflags \
#--without-timeoutfactor \
#--without-cpu

}
#############
src_compile(){ cd build ; default ; }
#############
src_install(){ cd build ; default ; rm -f "${D}/etc/ld.so.cache" ; }
#############
