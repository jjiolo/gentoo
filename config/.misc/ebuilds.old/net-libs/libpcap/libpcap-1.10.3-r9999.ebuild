#############
EAPI=8
#############
DESCRIPTION="A system-independent library for user-level network packet capture"
HOMEPAGE="https://www.tcpdump.org/ https://github.com/the-tcpdump-group/libpcap"
SRC_URI="https://www.tcpdump.org/release/${P}.tar.gz"
#############
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){

./configure \
--prefix=/usr \
--libdir=/usr/lib64 \
--enable-option-checking \
--enable-largefile \
--disable-protochain \
--enable-ipv6 \
--disable-remote \
--disable-optimizer-dbg \
--disable-yydebug \
--disable-universal \
--disable-shared \
--disable-usb \
--disable-netmap \
--disable-bluetooth \
--disable-dbus \
--disable-rdma \
\
--with-gcc \
--with-pcap=linux \
--without-libnl \
\
\
\
--without-septel \
--without-snf \
--without-snf-includes \
--without-snf-libraries \
--without-turbocap \
--without-dpdk

#--without-dag \
#--without-dag-includes \
#--without-dag-libraries \

}
#############
src_install(){ default ; }
#############
