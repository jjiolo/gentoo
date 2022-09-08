#############
EAPI="8"
#############
DESCRIPTION="An enhanced, drop-in replacement for MySQL"
HOMEPAGE="https://mariadb.org/"
SRC_URI="https://downloads.mariadb.org/interstitial/${P}/source/${P}.tar.gz"
#############
LICENSE="GPL-2 LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/libaio
dev-libs/libpcre
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
sys-libs/ncurses
"
DEPEND="${RDEPEND} dev-util/cmake"
#############
src_configure(){ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr; }
#############
src_install(){

install -o root -g root -m 0755 -d plugin/auth_pam/auth_pam_tool data

scripts/mysql_install_db\
 --auth-root-authentication-method=socket\
 --auth-root-socket-user=mysql\
 --builddir=./\
 --datadir=./data\
 --force\
 --skip-name-resolve\
 --skip-test-db\
 --srcdir=./

install -o root -g root -m 0755 -d "${D}/etc" "${D}/etc/services" "${D}/etc/services/mysqld" "${D}/etc/services/mysqld/files"
cp -a data "${D}/etc/services/mysqld/files/data"

install -o root -g root -m 0755 -d "${D}/usr" "${D}/usr/share"
install -o root -g root -m 0644 sql/share/english/errmsg.sys "${D}/usr/share"

install -o root -g root -m 0755 -d "${D}/usr" "${D}/usr/bin" "${D}/usr/sbin"
install -o root -g root -m 0755 client/mysql "${D}/usr/bin"
install -o root -g root -m 0755 sql/mysqld "${D}/usr/sbin"
}
#############

