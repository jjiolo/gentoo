#############
EAPI=8
#############
DESCRIPTION="Linux quota tools"
HOMEPAGE="https://sourceforge.net/projects/linuxquota/"
SRC_URI="https://sourceforge.net/projects/linuxquota/files/quota-tools/${PV}/${P}.tar.gz/download -> ${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-largefile \
--disable-nls \
--disable-rpath \
--enable-pie \
--disable-werror \
--disable-ldapmail \
--disable-ext2direct \
--disable-netlink \
--disable-libwrap \
--disable-rpc \
--disable-rpcsetquota \
--disable-xfs-roothack \
--disable-bsd-behaviour \
\
--with-gnu-ld \
--without-libiconv-prefix \
--without-libintl-prefix \
--without-proc-mounts \
--with-pid-dir=/run
}
#############
src_install() {
install -d -o root -g root -m 0755 "${D}/bin" "${D}/sbin"
install -o root -g root -m 0755 "quotaon" "${D}/sbin"
install -o root -g root -m 0755 "setquota" "${D}/sbin"
install -o root -g root -m 0755 "repquota" "${D}/sbin"
}
#############
