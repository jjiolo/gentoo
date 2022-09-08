#############
EAPI="7"
#############
DESCRIPTION="userland tools for fs-verity"
HOMEPAGE="https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git"
SRC_URI="https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git/snapshot/fsverity-utils-1.5.tar.gz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
dev-libs/openssl
sys-libs/glibc
sys-libs/zlib
"
DEPEND=""
#############
src_configure(){ default ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "fsverity" "${D}/sbin"
}
#############
