#############
EAPI="7"
#############
DESCRIPTION="An IRC server written from scratch"
HOMEPAGE="https://ngircd.barton.de/"
SRC_URI="https://ngircd.barton.de/pub/${PN}/${P}.tar.gz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="sys-libs/glibc[static-libs]"
#############
src_configure(){
LDFLAGS=-static ./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--disable-ircplus \
--enable-ipv6 \
--disable-sniffer \
--disable-debug \
--disable-strict-rfc \
\
--with-syslog \
--without-zlib \
--without-select \
--without-poll \
--without-devpoll \
--with-epoll \
--without-kqueue \
--without-openssl \
--without-gnutls \
--without-tcp-wrappers \
--without-ident \
--without-pam \
--without-iconv
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/sbin"
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/share"
install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/share/ngircd"
install    -o root -g root -m 0755 src/ngircd/ngircd "${D}/usr/sbin"
install    -o root -g root -m 0644 doc/Commands.txt "${D}/usr/share/ngircd"
install    -o root -g root -m 0644 doc/Modes.txt "${D}/usr/share/ngircd"
ln -s "ngircd" "${D}/usr/sbin/ircd"
}
#############
