#############
EAPI="7"
#############
DESCRIPTION="LDAP suite of application and development tools"
HOMEPAGE="https://www.OpenLDAP.org/"
SRC_URI="https://openldap.org/software/download/OpenLDAP/openldap-release/${P}.tgz"
#############
LICENSE="OPENLDAP GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND} sys-apps/groff"
#############
src_configure(){
./configure \
--prefix=/usr \
--bindir=/bin \
--sysconfdir=/etc/openldap \
--libdir=/usr/lib64 \
--sbindir=/sbin \
--libexecdir=/sbin \
\
--enable-option-checking \
--enable-debug \
--disable-dynamic \
--enable-syslog \
--enable-ipv6 \
--enable-local \
\
--enable-slapd \
--disable-dynacl \
--disable-aci \
--enable-cleartext \
--disable-crypt \
--disable-spasswd \
--disable-modules \
--disable-rlookups \
--disable-slapi \
--disable-slp \
--disable-wrappers \
\
--disable-backends \
--disable-dnssrv \
--disable-ldap \
--enable-mdb \
--disable-meta \
--disable-asyncmeta \
--disable-null \
--disable-passwd \
--disable-perl \
--disable-relay \
--disable-sock \
--disable-sql \
--disable-wt \
\
--disable-overlays \
--disable-accesslog \
--disable-auditlog \
--disable-autoca \
--disable-collect \
--disable-constraint \
--disable-dds \
--disable-deref \
--disable-dyngroup \
--disable-dynlist \
--disable-homedir \
--disable-memberof \
--disable-otp \
--disable-ppolicy \
--disable-proxycache \
--disable-refint \
--disable-remoteauth \
--disable-retcode \
--disable-rwm \
--disable-seqmod \
--disable-sssvlv \
--disable-syncprov \
--disable-translucent \
--disable-unique \
--disable-valsort \
\
--disable-argon2 \
\
--disable-balancer \
\
--enable-static \
--enable-shared \
--disable-versioning \
--disable-fast-install \
--enable-libtool-lock \
\
--without-subdir \
--without-cyrus-sasl \
--without-systemd \
--without-fetch \
--with-threads \
--without-tls \
--without-yielding-select \
--without-mp \
--with-odbc=auto \
--without-argon2 \
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot
}
#############
src_install(){ default ; rm -r "${D}/usr/var" ; }
#############
