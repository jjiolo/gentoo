#############
EAPI="7"
#############
DESCRIPTION="Linux IPv6 Router Advertisement Daemon"
HOMEPAGE="http://v6web.litech.org/radvd/"
SRC_URI="https://github.com/reubenhwk/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
#############
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND=""
#############
src_configure(){
LDFLAGS=-static ./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--without-check \
--without-logfile \
--without-pidfile \
--without-configfile \
--with-facility=daemon \
--without-systemdsystemunitdir
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "radvd" "${D}/sbin"
}
#############
