#############
EAPI=7
#############
DESCRIPTION="Linux Key Management Utilities"
HOMEPAGE="https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git"
SRC_URI="https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot/${P}.tar.gz"
#############
LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND=""
#############
src_configure(){ default ; }
#############
src_install(){ make DESTDIR=${D} PREFIX=/usr LIBDIR=/usr/lib64 ${MAKEOPTS} install ; }
#############
