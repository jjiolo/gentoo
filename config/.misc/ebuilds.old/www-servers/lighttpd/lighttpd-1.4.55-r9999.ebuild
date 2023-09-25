#############
EAPI="7"
#############
DESCRIPTION="Lightweight high-performance web server"
HOMEPAGE="http://www.lighttpd.net/"
SRC_URI="https://download.lighttpd.net/lighttpd/releases-1.4.x/${P}.tar.xz"
#############
LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND=""
#############
src_configure() {
for i in indexfile staticfile dirlisting alias accesslog cgi;do printf "%s\n" "PLUGIN_INIT(mod_${i})" >> src/plugin-static.h;done
LIGHTTPD_STATIC=yes ./configure \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-static=yes \
--enable-shared=no \
--disable-fast-install \
--enable-libtool-lock \
--enable-lfs \
--enable-ipv6 \
--disable-mmap \
--disable-extra-warnings \
\
--with-gnu-ld \
--with-pic \
--with-aix-soname=aix \
--with-sysroot \
--without-libev \
--without-mysql \
--without-pgsql \
--without-dbi \
--without-sasl \
--without-ldap \
--without-pam \
--without-attr \
--without-valgrind \
--without-libunwind \
--without-krb5 \
--without-openssl \
--without-wolfssl \
--without-pcre \
--without-zlib \
--without-bzip2 \
--without-fam \
--without-webdav-props \
--without-libxml \
--without-sqlite \
--without-webdav-locks \
--without-uuid \
--without-gdbm \
--without-geoip \
--without-maxminddb \
--without-memcached \
--without-lua
}
#############
src_install(){
strip -s src/lighttpd
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "src/lighttpd" "${D}/sbin"
}
#############
