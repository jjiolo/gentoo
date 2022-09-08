#############
EAPI=6
#############
DESCRIPTION="The PHP language runtime engine"
HOMEPAGE="https://secure.php.net/"
SRC_URI="https://secure.php.net/distributions/${P}.tar.xz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND=""
#############
src_configure() {
econf\
 --disable-cli\
 --disable-all\
 --enable-json\
 --enable-ctype\
 --with-iconv\
 --enable-mbstring\
 --enable-hash\
 --enable-session\
 --with-mysqli\
 --without-pear\
 --enable-fpm\
 --with-fpm-user=nobody\
 --with-fpm-group=nogroup\
 --disable-cgi\
 --with-config-file-path=/etc/php/php.ini\
 --with-config-file-scan-dir=/etc/php\
 --disable-short-tags\
 --disable-ipv6\
 --without-sqlite3\
 --without-cdb\
 --without-pdo-sqlite\
 --disable-inline-optimization\
 --disable-zend-signals\
 --with-tsrm-pthreads\
 --with-pic
}
#############
src_install() {
into /
dodir /usr/sbin
cp sapi/fpm/php-fpm "${D}"/usr/sbin
}
#############

