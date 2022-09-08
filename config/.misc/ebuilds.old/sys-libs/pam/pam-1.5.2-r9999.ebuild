#############
EAPI=8
#############
MY_P="Linux-${PN^^}-${PV}"
#############
DESCRIPTION="Linux-PAM (Pluggable Authentication Modules)"
HOMEPAGE="https://github.com/linux-pam/linux-pam"
SRC_URI="https://github.com/linux-pam/linux-pam/releases/download/v${PV}/${MY_P}.tar.xz"
#############
LICENSE="|| ( BSD GPL-2 )"
SLOT="0"
KEYWORDS=""
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
S="${WORKDIR}/${MY_P}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-static \
--enable-shared \
--disable-fast-install \
--enable-libtool-lock \
--enable-largefile \
--enable-Werror \
--enable-pie \
--disable-doc \
--disable-prelude \
--disable-debug \
--enable-securedir=$libdir/security \
--enable-isadir=$libdir/security \
--enable-sconfigdir=$sysconfdir/security \
--enable-pamlocking \
--disable-read-both-confs \
--disable-lckpwdf \
--disable-audit \
--enable-db=no \
--disable-nis \
--disable-usergroups \
--disable-selinux \
--disable-econf \
--disable-vendordir \
--enable-openssl \
--disable-regenerate-docu \
--disable-nls \
--disable-rpath \
--disable-unix \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-libprelude-prefix \
--without-mailspool \
--without-xauth \
--with-randomdev=/dev/random \
--without-db-uniquename \
--without-xml-catalog \
--without-libiconv-prefix \
--without-libintl-prefix \
--with-uidmin=32378 \
--with-sysuidmin=1 \
--with-kernel-overflow-uid=65534 \
--without-systemdunitdir \
--with-misc-conv-bufsize=4096
}
#############
src_install(){ default ; }
#############

