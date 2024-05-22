#############
EAPI=8
#############
DESCRIPTION="GNU libc C library"
HOMEPAGE="https://www.gnu.org/software/libc/"
SRC_URI="mirror://gnu/glibc/${P}.tar.xz"
#############
LICENSE="LGPL-2.1+ BSD HPND ISC inner-net rc PCRE"
SLOT="2.2"
KEYWORDS="" #amd64"
IUSE="+static-libs"
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){
sed -i '108,125d' Makefile
sed -i 's/NS_DEFAULTPORT\t53/NS_DEFAULTPORT\t3535/' resolv/arpa/nameser.h
sed -i 's/\/etc\/resolv.conf/\/run\/derp/' resolv/resolv.h
mkdir build
cd build
use_ldconfig=no ../configure \
--prefix=/usr \
--libdir=/usr/lib64 \
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
--disable-static-nss \
--disable-force-install \
--disable-maintainer-mode \
--disable-kernel \
--disable-werror \
--disable-multi-arch \
--disable-memory-tagging \
--disable-systemtap \
--disable-build-nscd \
--disable-nscd \
--disable-pt_chown \
--disable-mathvec \
--disable-cet \
--disable-scv \
--enable-fortify-source=3 \
\
--without-pkgversion \
--without-bugurl \
--without-gd \
--with-gd-include=/usr/include \
--with-gd-lib=/usr/lib64 \
--with-binutils=/usr/bin \
--without-selinux \
--with-headers=/usr/include \
--with-nonshared-cflags="" \
--with-rtld-early-cflags="" \
--with-timeoutfactor=1 \
--without-cpu
}
#############
src_compile(){ cd build ; default ; }
#############
src_install(){ cd build ; make install_root="${D}" install ; } # default ; }
#############
