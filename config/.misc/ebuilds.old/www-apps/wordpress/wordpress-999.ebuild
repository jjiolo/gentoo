#############
EAPI=6
#############
HOMEPAGE="https://wordpress.org/"
DESCRIPTION="Wordpress PHP and MySQL based content management system (CMS)"
SRC_URI="https://wordpress.org/latest.tar.gz"
#############
LICENSE="GPL-2+"
SLOT="0"
IUSE=""
KEYWORDS="~amd64"
RDEPEND=""
DEPEND="${RDEPEND}"
S=${WORKDIR}/${PN}
#############
src_install() { into /;dodir /etc/wordpress;cp -ar ./* "${D}"/etc/wordpress
printf "%s\n" "<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'localhost:/tmp/.mysqld');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
define('FS_METHOD', 'direct');
define('WP_TEMP_DIR','/dev/shm');
define('AUTH_KEY',         '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
define('SECURE_AUTH_KEY',  '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
define('LOGGED_IN_KEY',    '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
define('NONCE_KEY',        '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
define('AUTH_SALT',        '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
define('SECURE_AUTH_SALT', '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
define('LOGGED_IN_SALT',   '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
define('NONCE_SALT',       '$(tr -cd 'a-zA-Z0-9'</dev/urandom|head -c32)');
\$table_prefix  = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
 define('ABSPATH', dirname(__FILE__) . '/etc/wordpress');
require_once(ABSPATH . 'wp-settings.php');
" > "${D}"/etc/wordpress/wp-config.php
find "${D}" -name '._cfg*' -exec rm {} \;;
find "${D}" -type f -exec chmod 644 {} \;;
find "${D}" -type d -exec chmod 755 {} \;; }
#############
