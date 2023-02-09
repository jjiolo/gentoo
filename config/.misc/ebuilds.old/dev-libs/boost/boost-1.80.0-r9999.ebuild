#############
EAPI=8
#############
DESCRIPTION="Boost Libraries for C++"
HOMEPAGE="https://www.boost.org/"
SRC_URI="https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${PN}_${PV//./_}.tar.bz2 -> ${P}.tar.bz2"
#############
LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="
sys-libs/glibc
"
DEPEND=""
S="${WORKDIR}/${PN}_${PV//./_}"
#############
src_configure(){

./bootstrap.sh \
--prefix=${D}/usr \
--libdir=${D}/usr/lib64 \
--with-libraries=atomic,date_time,filesystem,program_options,system \
--without-icu

./b2 \
--prefix=${D}/usr \
--libdir=${D}/usr/lib64 \
--no-cmake-config \
--build-type=minimal \
--build-dir=build \
--layout=system \
--with-atomic \
--with-date_time \
--with-filesystem \
--with-program_options \
--with-system \
variant=release \
threading=single \
link=shared

}
#############
src_install(){ ./b2 install || die "install failed" ; }
#############
