#############
EAPI="7"
#############
DESCRIPTION="opentracker"
HOMEPAGE=""
SRC_URI=""
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="sys-libs/zlib sys-libs/glibc"
DEPEND="${RDEPEND} dev-libs/libowfat"
#############
pkg_setup(){

  git clone https://erdgeist.org/gitweb/opentracker "${S}"

  sed -ie '/^LIBOWFAT_HEADERS=/c\LIBOWFAT_HEADERS=/usr/include/libowfat' "${S}/Makefile"
  sed -ie '/^LIBOWFAT_LIBRARY=/c\LIBOWFAT_LIBRARY=/usr/lib64' "${S}/Makefile"
# sed -ie '1iFEATURES+=-DWANT_V6' "${S}/Makefile"

  chown -R portage:portage "${S}"

}
#############
src_configure(){ true; }
#############
src_compile(){ LDFLAGS=-static make; }
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "opentracker" "${D}/sbin/opentracker"
}
#############
