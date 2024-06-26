#############
EAPI=8
#############
DESCRIPTION="Console display library" ; MPV="${PV:0:3}" ; MP="${PN}-${MPV}"
HOMEPAGE="https://invisible-island.net/ncurses/"
SRC_URI="https://invisible-island.net/archives/${PN}/${MP}.tar.gz"
#############
LICENSE="MIT"
SLOT="1"
KEYWORDS="amd64"
IUSE="+static-libs"
RDEPEND=""
DEPEND=""
S="${WORKDIR}/${MP}"
#############

date="20240427 20240504 20240511 20240518 20240519 20240525 20240601 20240608"

for i in ${date} ; do SRC_URI+=" https://invisible-island.net/archives/${PN}/${MPV}/${MP}-${i}.patch.gz " ; done

src_prepare(){ for i in ${date} ; do cd "${S}" ; gunzip "${DISTDIR}/${MP}-${i}.patch.gz" -c | patch -p1 ; eapply_user ; done ; }

#############
src_configure(){

for i in ncurses ncursesw ncursest ncursestw ; do

mkdir "${WORKDIR}/${i}" && cd "${WORKDIR}/${i}"

default="--prefix=/usr --libdir=/usr/lib64 --with-termlib "
default+="--without-ada --without-cxx --without-cxx-binding "
default+="--with-shared --with-normal --without-debug --without-profile --without-cxx-shared "
default+="--without-manpages --with-progs --without-tests "
default+="--with-terminfo-dirs=/etc/terminfo:/usr/share/terminfo "
default+="--enable-db-install --enable-database --without-hashed-db "
default+="--disable-termcap --disable-getcap --disable-getcap-cache "
default+="--without-sysmouse --without-gpm --without-dlsym "
default+="--without-develop --enable-rpath --enable-symlinks --without-pcre2 "
default+="--disable-home-terminfo --disable-root-environ --disable-root-access --disable-setuid-environ "

# extensions - forces ext-funcs, tcap-names : testing sigwinch (busybox)
default+="--enable-ext-funcs --disable-sp-funcs --disable-term-driver --disable-const --disable-ext-colors --disable-ext-mouse --disable-ext-putwin --disable-no-padding --enable-sigwinch --enable-tcap-names "
# experimental - forces hashmap : testing safe-sprintf
default+="--disable-assumed-color --enable-hashmap --disable-colorfgbg --disable-fvisibility --disable-interop --enable-safe-sprintf --disable-scroll-hints --disable-wgetch-events --disable-exp-win32 "

[ "${i}" == "ncurses" ] && default+="--enable-overwrite --disable-widec --without-pthread --without-reentrant"
[ "${i}" == "ncursesw" ] && default+="--includedir=/usr/include/${i} --enable-widec --without-pthread --without-reentrant"
[ "${i}" == "ncursest" ] && default+="--includedir=/usr/include/${i} --disable-widec --with-pthread --with-reentrant"
[ "${i}" == "ncursestw" ] && default+="--includedir=/usr/include/${i} --enable-widec --with-pthread --with-reentrant"

../${MP}/configure ${default} || die "configure fail"

done

}
#############
src_compile(){ for i in ncurses ncursesw ncursest ncursestw ; do cd "${WORKDIR}/${i}" && make ${MAKEOPTS} || die "compile fail" ; done ; }
#############
src_install(){
 for i in ncurses ncursesw ncursest ncursestw ; do cd "${WORKDIR}/${i}" && make DESTDIR="${D}" install || die "compile fail" ; done
 install -d -o 0 -g 0 -m 0755 "${D}/opt" ; mv ${D}/* ${D}/opt
}
#############

