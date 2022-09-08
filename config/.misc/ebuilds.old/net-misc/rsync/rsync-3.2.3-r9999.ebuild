#############
EAPI="7"
#############
DESCRIPTION="File transfer program to keep remote files into sync"
HOMEPAGE="https://rsync.samba.org"
SRC_URI="https://rsync.samba.org/pub/rsync/src/rsync-3.2.3.tar.gz"
#############
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
#############
src_configure(){
LDFLAGS="-static" ./configure \
--prefix=/usr \
--enable-option-checking \
--disable-debug \
--disable-profile \
--disable-md2man \
--disable-maintainer-mode \
--disable-simd \
--disable-asm \
--enable-largefile \
--enable-ipv6 \
--disable-locale \
--disable-openssl \
--disable-xxhash \
--disable-zstd \
--disable-lz4 \
--disable-iconv-open \
--disable-iconv \
--disable-acl-support \
--disable-xattr-support \
\
--without-included-popt \
--without-included-zlib \
--with-protected-args \
--with-rsync-path=rsync \
--with-rsyncd-conf=/etc/rsyncd.conf \
--with-rsh=dbclient \
--with-nobody-group=nobody
}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/bin"
install    -o root -g root -m 0755 "rsync" "${D}/bin" || die "install failed"
}
#############
