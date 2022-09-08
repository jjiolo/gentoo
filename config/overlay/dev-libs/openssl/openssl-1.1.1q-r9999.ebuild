#############
EAPI="7"
#############
DESCRIPTION="full-strength general purpose cryptography library (including SSL and TLS)"
HOMEPAGE="https://www.openssl.org/"
SRC_URI="https://www.openssl.org/source/${P}.tar.gz"
#############
LICENSE="openssl"
SLOT="0/1.1"
KEYWORDS="amd64"
IUSE="+static-libs -bindist"
RDEPEND="sys-libs/glibc sys-libs/zlib"
DEPEND="${RDEPEND}"
#############
src_configure(){
./config \
--libdir=/usr/lib64 \
--openssldir=/etc/ssl \
--prefix=/usr \
--release \
--with-rand-seed=os,devrandom \
no-afalgeng \
no-asan \
enable-asm \
no-async \
enable-autoalginit \
enable-autoerrinit \
no-autoload-config \
no-buildtest-c++ \
no-capieng \
no-cms \
enable-comp \
no-crypto-mdebug \
no-crypto-mdebug-backtrace \
no-ct \
enable-deprecated \
no-dgram \
no-dso \
no-devcryptoeng \
no-dynamic-engine \
enable-ec \
no-ec2m \
no-ec_nistp_64_gcc_128 \
no-egd \
enable-engine \
enable-err \
no-external-tests \
enable-filenames \
no-fuzz-libfuzzer \
no-fuzz-afl \
no-gost \
no-hw-padlock \
no-makedepend \
no-multiblock \
no-nextprotoneg \
enable-ocsp \
enable-pic \
no-pinshared \
no-posix-io \
no-psk \
no-rdrand \
no-rfc3779 \
no-sctp \
shared \
enable-sock \
no-srp \
no-srtp \
enable-sse2 \
no-ssl-trace \
no-static-engine \
enable-stdio \
no-tests \
enable-threads \
no-ts \
disable-ubsan \
no-ui-console \
no-unit-test \
no-weak-ssl-ciphers \
enable-zlib \
no-zlib-dynamic \
\
no-ssl \
no-ssl3 \
enable-tls \
no-tls1 \
no-tls1_1 \
enable-tls1_2 \
enable-tls1_3 \
no-dtls \
no-dtls1 \
no-dtls1_2 \
\
no-ssl3-method \
no-tls1-method \
enable-tls1_1-method \
enable-tls1_2-method \
no-dtls1-method \
no-dtls1_2-method \
\
no-md2 \
no-rc5 \
\
no-aria \
no-bf \
no-blake2 \
no-camellia \
no-cast \
enable-chacha \
no-cmac \
enable-des \
enable-dh \
no-dsa \
enable-ecdh \
enable-ecdsa \
no-idea \
enable-md4 \
no-mdc2 \
no-ocb \
enable-poly1305 \
no-rc2 \
enable-rc4 \
no-rmd160 \
enable-scrypt \
no-seed \
no-siphash \
no-sm2 \
no-sm3 \
no-sm4 \
no-whirlpool
}
#############
src_install(){ make DESTDIR="${D}" install_sw install_ssldirs ; rm "${D}/usr/bin/c_rehash" ; }
#############
