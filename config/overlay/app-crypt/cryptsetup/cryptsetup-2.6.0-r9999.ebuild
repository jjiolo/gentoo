#############
EAPI=7
#############
DESCRIPTION="Tool to setup encrypted devices with dm-crypt"
HOMEPAGE="https://gitlab.com/cryptsetup/cryptsetup/blob/master/README.md"
SRC_URI="https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.6/${P}.tar.xz"
#############
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND=""
DEPEND="
${RDEPEND}
dev-libs/json-c[static-libs]
dev-libs/popt[static-libs]
sys-fs/lvm2[static-libs]
sys-libs/glibc[static-libs]
"
#############
src_configure(){
./configure \
--prefix=/usr \
--enable-option-checking \
--enable-silent-rules \
--disable-dependency-tracking \
--enable-static \
--enable-shared \
--disable-fast-install \
--enable-libtool-lock \
--disable-asciidoc \
--disable-keyring \
--enable-largefile \
--disable-external-tokens \
--disable-ssh-token \
--disable-luks2-reencryption \
--disable-nls \
--disable-rpath \
--disable-fips \
--disable-pwquality \
--disable-fuzz-targets \
--disable-passwdqc \
--enable-static-cryptsetup \
--enable-cryptsetup \
--disable-veritysetup \
--disable-integritysetup \
--disable-selinux \
--disable-udev \
--enable-kernel_crypto \
--disable-gcrypt-pbkdf2 \
--disable-internal-argon2 \
--disable-libargon2 \
--disable-internal-sse-argon2 \
--disable-blkid \
--enable-dev-random \
--disable-luks-adjust-xts-keysize \
\
--with-pic \
--with-aix-soname=aix \
--with-gnu-ld \
--with-sysroot \
--with-gnu-ld \
--without-libiconv-prefix \
--without-libintl-prefix \
--with-crypto_backend=kernel \
--without-libgcrypt-prefix \

#--with-plain-hash= \
#--with-plain-cipher= \
#--with-plain-mode= \
#--with-plain-keybits= \
#--with-luks1-hash= \
#--with-luks1-cipher= \
#--with-luks1-mode= \
#--with-luks1-keybits= \
#--with-luks2-pbkdf= \
#--with-luks1-iter-time= \
#--with-luks2-iter-time= \
#--with-luks2-memory-kb= \
#--with-luks2-parallel-threads= \
#--with-luks2-keyslot-cipher= \
#--with-luks2-keyslot-keybits= \
#--with-loopaes-cipher= \
#--with-loopaes-keybits= \
#--with-keyfile-size-maxkb= \
#--with-integrity-keyfile-size-maxkb \
#--with-passphrase-size-max= \
#--with-verity-hash= \
#--with-verity-data-block= \
#--with-verity-hash-block= \
#--with-verity-salt-size= \
#--with-verity-fec-roots= \
#--with-tmpfilesdir= \
#--with-luks2-lock-path= \
#--with-luks2-lock-dir-perms= \
#--with-luks2-external-tokens-path \
#--with-default-luks-format=

}
#############
src_install(){
install -d -o root -g root -m 0755 "${D}/sbin"
install    -o root -g root -m 0755 "cryptsetup.static" "${D}/sbin/cryptsetup" || die "install failed"
}
#############
