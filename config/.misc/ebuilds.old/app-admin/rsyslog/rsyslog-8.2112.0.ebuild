#############
EAPI="7"
#############
DESCRIPTION="An enhanced multi-threaded syslogd with database support and more"
HOMEPAGE="https://www.rsyslog.com/"
SRC_URI="https://www.rsyslog.com/files/download/${PN}/${P}.tar.gz"
#############
LICENSE="GPL-3 LGPL-3 Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libestr
dev-libs/libfastjson
dev-libs/librelp
sys-libs/glibc
sys-libs/zlib
"
DEPEND=""
#############
src_configure() {
./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-silent-rules \
--disable-aix64bits \
--disable-dependency-tracking \
--enable-static \
--enable-shared \
--disable-fast-install \
--disable-Werror \
--disable-atomic-operations \
--enable-largefile \
--enable-regexp \
--disable-fmhash \
--disable-fmhash-xxhash \
--disable-ffaup \
--disable-fmunflatten \
--disable-gssapi-krb5 \
--disable-root-tests \
--enable-klog \
--disable-kmsg \
--disable-imjournal \
--disable-libsystemd \
--enable-inet \
--disable-jemalloc \
--disable-unlimited-select \
--disable-debug \
--disable-debug-symbols \
--disable-debugless \
--disable-valgrind \
--disable-diagtools \
--disable-usertools \
--disable-mysql \
--disable-pgsql \
--disable-libdbi \
--disable-snmp \
--disable-snmp-tests \
--disable-uuid \
--disable-elasticsearch \
--disable-clickhouse \
--disable-omhttp \
--disable-elasticsearch-tests \
--disable-clickhouse-tests \
--disable-openssl \
--disable-gnutls \
--disable-gnutls-tests \
--disable-libgcrypt \
--enable-rsyslogrt \
--enable-rsyslogd \
--disable-extended-tests \
--disable-mysql-tests \
--disable-pgsql-tests \
--disable-mail \
--disable-fmhttp \
--disable-imdiag \
--disable-mmnormalize \
--disable-mmjsonparse \
--disable-mmgrok \
--disable-mmaudit \
--disable-mmanon \
--disable-mmrm1stspace \
--disable-mmutf8fix \
--disable-mmcount \
--disable-mmsequence \
--disable-mmdblookup \
--disable-mmdarwin \
--disable-mmfields \
--disable-mmpstrucdata \
--disable-mmrfc5424addhmac \
--disable-omfile-hardened \
--enable-relp \
--disable-omrelp-default-port \
--disable-ksi-ls12 \
--disable-liblogging-stdlog \
--disable-rfc3195 \
--disable-testbench \
--disable-libfaketime \
--disable-default-tests \
--disable-helgrind \
--disable-imbatchreport \
--disable-pmdb2diag \
--disable-imfile \
--disable-imfile-tests \
--disable-imdocker \
--disable-imdocker-tests \
--disable-imtuxedoulog \
--disable-improg \
--disable-imhttp \
--disable-imsolaris \
--disable-imptcp \
--disable-impstats \
--disable-impcap \
--disable-omprog \
--disable-omudpspoof \
--disable-omstdout \
--disable-omjournal \
--disable-journal-tests \
--disable-pmlastmsg \
--disable-pmcisconames \
--disable-pmciscoios \
--disable-pmnull \
--disable-pmnormalize \
--disable-pmaixforwardedfrom \
--disable-pmsnare \
--disable-pmpanngfw \
--disable-omruleset \
--disable-omuxsock \
--disable-mmsnmptrapd \
--disable-omhdfs \
--disable-omkafka \
--disable-imkafka \
--disable-kafka-tests \
--disable-kafka-static \
--disable-ommongodb \
--disable-imczmq \
--disable-omczmq \
--disable-omrabbitmq \
--disable-imhiredis \
--disable-omhiredis \
--disable-omhttpfs \
--disable-omamqp1 \
--disable-omtcl \
--disable-mmkubernetes \
--disable-mmtaghostname \
--disable-generate-man-pages \
--disable-distcheck-workaround \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--without-moddirs \
--without-systemdsystemunitdir \
--without-valgrind-testbench \
--without-tcl
}
#############
src_install() { default ; }
#############
