#############
EAPI=8
#############
DESCRIPTION="Userspace utilities for storing and processing auditing records"
HOMEPAGE="https://people.redhat.com/sgrubb/audit/"
SRC_URI="https://people.redhat.com/sgrubb/audit/${P}.tar.gz"
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
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--enable-shared \
--enable-static \
--disable-fast-install \
--disable-dependency-tracking \
--enable-libtool-lock \
--disable-listener \
--disable-zos-remote \
--disable-gssapi-krb5 \
--disable-systemd \
--disable-experimental \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-python \
--without-python-sys-prefix \
--without-python_prefix \
--without-python_exec_prefix \
--without-python3 \
--without-golang \
--without-debug \
--without-warn \
--without-arm \
--without-aarch64 \
--without-apparmor \
--without-libwrap \
--without-io_uring \
--without-libcap-ng
}
#############
src_install() {
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/sbin"
install    -o root -g root -m 0755 "src/.libs/auditd" "${D}/usr/sbin" || die "install failed"
install    -o root -g root -m 0755 "src/.libs/auditctl" "${D}/usr/sbin" || die "install failed"
install    -o root -g root -m 0755 "src/.libs/aureport" "${D}/usr/sbin" || die "install failed"
install    -o root -g root -m 0755 "src/.libs/ausearch" "${D}/usr/sbin" || die "install failed"
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/lib64"
install    -o root -g root -m 0755 lib/.libs/libaudit.so* "${D}/usr/lib64" || die "install failed"
install    -o root -g root -m 0755 auparse/.libs/libauparse.so* "${D}/usr/lib64" || die "install failed"
}
#############

