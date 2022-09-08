#############
EAPI=7
#############
DESCRIPTION="Fuse-filesystem utilizing the sftp service"
HOMEPAGE="https://github.com/libfuse/sshfs"
SRC_URI="https://github.com/libfuse/${PN}/releases/download/${P}/${P}.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/glib
dev-libs/libpcre
sys-fs/fuse
sys-libs/glibc
"
DEPEND="${RDEPEND}"
#############
src_configure(){

meson build \
-Dprefix=/usr \
-Dbuildtype=release \
-Ddebug=false \
-Ddefault_library=both \
-Db_asneeded=true \
-Db_lto=true \
-Db_pgo=off \
-Db_pie=true \
-Db_sanitize=none \
-Db_staticpic=true \

}
#############
src_compile(){ ninja -C build ${MAKEOPTS} ; }
#############
src_install(){

 DESTDIR="${D}" ninja -C build install

 install -d -o root -g root -m 0755 "${D}/bin"

 install -o root -g root -m 0755 "build/sshfs" "${D}/bin"

 install -d -o root -g root -m 0755 "${D}/usr" "${D}/usr/bin" "${D}/usr/sbin"

 ln -s "/bin/dbclient" "${D}/usr/bin/ssh"
 ln -s "/sbin/dropbear" "${D}/usr/sbin/sshd"

}
#############
