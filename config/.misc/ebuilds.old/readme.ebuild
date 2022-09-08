#############
# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#############
#
# https://devmanual.gentoo.org/eclass-reference/
# https://devmanual.gentoo.org/eclass-reference/ebuild/index.html # ebuild.reference
#
#############
#
# generate a manifest
# ebuild package-version.ebuild manifest
#
############# # variables
# P        package name and version
# PN       package name
# PV       package version
# PR       package revision
# PVR      package version and revision
# PF       package full name
# A        source files
# CATEGORY package category
# FILESDIR path to files
# WORKDIR  path to work
# T        temporary directory
# D        temporary install directory
# HOME     temporary home directory
# ROOT     merge path
# DISTDIR  downloaded files
# EPREFIX  wtf
# ED       wtf
# EROOT    wtf
############# # eclasses
#ebuild.sh:{die,use,einfo,elog,ewarn,eerror,unpack,econf,emake,einstall}
#euser:{enewuser <user> [uid] [shell] [homedir] [groups],enewgroup <group> [gid]}
#############
EAPI=6
inherit user
#############
DESCRIPTION="hello world - an ebuild template"
HOMEPAGE="localhost"
SRC_URI="http://localhost/files/${PV}.tar.gz -> ${P}.tar.gz" # -> change url name to ${P}.tar.gz in distfiles
SRC_URI="http://localhost/files/${P}.tar.gz use0? ( http://localhost/files/${P}-use0.tar.gz )" # download if use flag enabled
PATCHES=( "${FILESDIR}/one.patch" "${FILESDIR}/two.patch" )
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~amd64"
IUSE="all use flags"
REQUIRED_USE=""
RESTRICT=""
DEPEND="build time dependencies"
RDEPEND="${DEPEND} run time dependencies"
HDEPEND="list of all programs required to be executable during compilation ie creating crossdev packages"
PDEPEND="post dependencies install after"
S="${WORKDIR}/${P}" # if unpacking the downloaded tarball doesnt extract into the correct naming scheme
PROPERTIES=""
DOCS=""
HTML_DOCS=""
############# # functions
pkg_pretend(){ return; }
#############
pkg_nofetch(){
[[ -z ${A} ]] && return
elog "The following files cannot be fetched for ${PN}:"
local x
for x in ${A}; do elog "   ${x}";done; }
#############
pkg_setup(){ return; }
#############
src_unpack(){ [[ -n ${A} ]] && unpack ${A}; }
#############
src_prepare(){
if declare -p PATCHES | grep -q "^declare -a ";then
  [[ -n ${PATHCHES[@]} ]] && eapply "${PATCHES[@]}"
 else
  [[ -n "${PATCHES}"   ]] && eapply ${PATCHES}
 fi
eapply_user;
}
##############
src_configure(){ [[ -x ${ECONF_SOURCE:-.}/configure ]] && econf; }
##############
src_compile(){ [[ -f Makefile || -f GNUmakefile || -f makefile ]] && { emake || die "emake failed" }; }
##############
src_test(){ return; } # default is huge never use it
##############
pkg_preinst(){ return; }
##############
src_install(){ [[ -f Makefile || -f GNUmakefile || -f makefile ]] && emake DESTDIR="${D}" install;einstalldocs; }
##############
pkg_postinst(){ return; } # elog "post install information"
##############
pkg_prerm(){ return; } # clean up package specific directories
##############
pkg_postrm(){ return; } # update symlinks
##############
pkg_config(){ return; } # interactive post install configuration
##############
