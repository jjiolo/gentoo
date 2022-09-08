#############
EAPI=7
#############
DESCRIPTION="Tool for running RAID systems - replacement for the raidtools"
HOMEPAGE="https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/"
SRC_URI="https://mirrors.edge.kernel.org/pub/linux/utils/raid/mdadm/mdadm-4.2.tar.xz"
#############
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/glibc"
DEPEND="${RDEPEND}"
#############
src_compile(){ COROSYNC="-DNO_COROSYNC" DLM="-DNO_DLM" CXFLAGS="-DNO_LIBUDEV" make ${MAKEOPTS} ; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "mdadm" "${D}/sbin" || die "install failed"
}
#############
