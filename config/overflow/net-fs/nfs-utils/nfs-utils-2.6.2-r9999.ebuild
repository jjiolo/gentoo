#############
EAPI=7
#############
DESCRIPTION="NFS client and server daemons"
HOMEPAGE="https://linux-nfs.org/"
SRC_URI="https://mirrors.edge.kernel.org/pub/linux/utils/${PN}/${PV}/${P}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libevent
sys-libs/glibc
"
DEPEND="
${RDEPEND}
net-libs/libtirpc
sys-apps/keyutils
"
#############
src_configure(){
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--disable-maintainer-mode \
--disable-dependency-tracking \
--enable-nfsv4 \
--disable-nfsv41 \
--disable-gss \
--disable-svcgss \
--disable-kprefix \
--disable-uuid \
--disable-mount \
--disable-libmount-mount \
--disable-sbin-override \
--disable-junction \
--enable-tirpc \
--enable-ipv6 \
--disable-mountconfig \
--disable-nfsdcld \
--disable-nfsdcltrack \
--enable-nfsv4server \
--disable-caps \
--enable-largefile \
--enable-shared \
--enable-static \
--disable-fast-install \
--enable-libtool-lock \
--disable-ldap \
--disable-gums \
\
--without-release \
--with-statedir=/run/nfsd \
--with-nfsconfig=/run/nfsd/nfs.conf \
--with-statdpath=/run/nfsd \
--with-statduser=nfsd \
--without-start-statd \
--without-systemd \
--without-modprobedir \
--with-rpcgen=internal \
--with-mountfile=/run/nfsd/nfsmount.conf \
--without-tirpcinclude \
--without-tcp-wrappers \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--without-sysroot \
--without-krb5 \
--without-gssglue \
--with-pluginpath=/run/nfsd
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "utils/exportfs/exportfs" "${D}/sbin" || die "install failed"
install    -o root -g root -m 0755 "utils/exportd/exportd"   "${D}/sbin" || die "install failed"
install    -o root -g root -m 0755 "utils/nfsd/nfsd"         "${D}/sbin" || die "install failed"
}
#############
