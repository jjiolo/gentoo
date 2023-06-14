#############
EAPI=8
#############
DESCRIPTION="The Common Unix Printing System"
HOMEPAGE="https://openprinting.github.io/cups"
SRC_URI="https://github.com/OpenPrinting/cups/releases/download/v${PV}/${P}-source.tar.gz -> ${P}.tar.gz"
#############
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="
dev-libs/openssl
sys-libs/glibc
sys-libs/libxcrypt
sys-libs/zlib
"
DEPEND="${RDEPEND}"
#############
src_configure(){

./configure \
--prefix=/usr \
--enable-option-checking \
--enable-static \
--disable-mallinfo \
--disable-libpaper \
--disable-libusb \
--disable-tcp-wrappers \
--disable-acl \
--disable-dbus \
--enable-shared \
--disable-libtool-unsupported \
--disable-debug \
--disable-debug-guards \
--disable-debug-printfs \
--disable-maintainer \
--disable-unit-tests \
--enable-relro \
--enable-sanitizer \
--disable-gssapi \
--disable-pam \
--enable-largefile \
--disable-page-logging \
--disable-sync-on-close \
--disable-browsing \
--disable-default-shared \
--disable-raw-printing \
--disable-webif \
--with-components=libcups

#--without-cups-build \
#--without-dbusdir \
#--without-adminkey \
#--without-operkey \
#--with-components=libcupslite \
#--without-cachedir \
#--without-icondir \
#--without-menudir \
#--without-docdir \
#--without-pkgconfpath \
#--without-logdir \
#--without-rundir \
#--without-optim \
#--without-archflags \
#--without-ldarchflags \
#--without-domainsocket \
#--without-gssservicename \
#--without-tls \
#--without-pam-module \
#--without-dnssd \
#--without-dnssd-libs \
#--without-dnssd-includes \
#--with-container=none \
#--without-ondemand \
#--without-systemd \
#--without-smfmanifestdir \
#--without-rcdir \
#--without-rclevels \
#--without-rcstart \
#--without-rcstop \
#--without-xinetd \
#--without-languages \
#--without-bundledir \
#--without-bundlelang \
#--with-exe-file-perm=0755 \
#--with-config-file-perm=0640 \
#--with-cupsd-file-perm=0700 \
#--with-log-file-perm=0644 \
#--with-max-log-size=1m \
#--with-error-policy=stop-printer \
#--with-fatal-errors=config \
#--with-log-level=warn \
#--with-access-log-level=none \
#--with-local-protocols \
#--with-cups-user=lp \
#--with-cups-group=lp \
#--with-system-groups=lpadmin \
#--without-printcap \
#--with-max-copies=9999 \
#--with-snmp-address=auto \
#--with-snmp-community=public \
#--with-ipp-port=631 \
#--with-idle-exit-timeout=60 \
#--with-systemd-timeoutstartsec=default

}
#############
src_install(){ default ; }
#############

