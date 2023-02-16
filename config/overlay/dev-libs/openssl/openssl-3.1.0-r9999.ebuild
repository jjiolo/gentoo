#############
EAPI="7"
#############
DESCRIPTION="full-strength general purpose cryptography library (including SSL and TLS)"
HOMEPAGE="https://www.openssl.org/"
SRC_URI="https://www.openssl.org/source/${P}-beta1.tar.gz"
#############
LICENSE="openssl"
SLOT="0"
KEYWORDS="" #amd64"
IUSE="+static-libs -bindist"
RDEPEND="sys-libs/glibc sys-libs/zlib"
DEPEND="${RDEPEND}"
#############
src_configure(){
./config \
--release \
--libdir=/usr/lib64 \
--openssldir=/etc/ssl \
--prefix=/usr \
--with-zlib-include=/usr/include \
--with-zlib-lib=/usr/lib64 \
--with-rand-seed=os,devrandom \
no-afalgeng \
no-ktls \
no-asan \
no-acvp-tests \
enable-asm \
no-async \
enable-autoalginit \
enable-autoerrinit \
enable-autoload-config \
no-buildtest-c++ \
enable-bulk \
enable-cached-fetch \
no-capieng \
no-cmp \
no-cms \
enable-comp \
no-crypto-mdebug \
no-crypto-mdebug-backtrace \
no-ct \
enable-deprecated \
enable-dgram \
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
no-fips \
no-fips-securitychecks \
no-fuzz-libfuzzer \
no-fuzz-afl \
no-gost \
no-legacy \
no-makedepend \
no-module \
no-multiblock \
no-nextprotoneg \
enable-ocsp \
no-padlockeng \
no-hw-padlock \
enable-pic \
no-pinshared \
no-posix-io \
no-psk \
no-rdrand \
no-rfc3779 \
no-sctp \
enable-shared \
enable-sock \
no-srp \
no-srtp \
enable-sse2 \
no-ssl-trace \
no-static-engine \
enable-stdio \
no-tests \
enable-threads \
no-trace \
no-ts \
disable-ubsan \
no-ui-console \
no-unit-test \
no-uplink \
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
enable-dtls \
no-dtls1 \
enable-dtls1_2 \
\
no-ssl3-method \
no-tls1-method \
enable-tls1_1-method \
enable-tls1_2-method \
no-dtls1-method \
enable-dtls1_2-method \
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
enable-cmac \
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
no-siv \
no-sm2 \
no-sm3 \
no-sm4 \
no-whirlpool
}
#############
src_install(){ make DESTDIR="${D}" install_sw install_ssldirs ; rm "${D}/usr/bin/c_rehash" ; }
#############
