#############
EAPI=8
#############
DESCRIPTION="full-strength general purpose cryptography library (including SSL and TLS)"
HOMEPAGE="https://www.openssl.org/"
SRC_URI="https://www.openssl.org/source/${P}.tar.gz"
#############
LICENSE="openssl"
SLOT="0"
KEYWORDS="amd64"
IUSE="+static-libs -bindist"
RDEPEND="sys-libs/glibc sys-libs/zlib"
DEPEND="${RDEPEND}"
#############
src_configure(){
./config \
--release \
--prefix=/usr \
--libdir=/usr/lib64 \
--openssldir=/etc/ssl \
--with-brotli-include=/usr/include \
--with-brotli-lib=/usr/include \
--with-zlib-include=/usr/include \
--with-zlib-lib=/usr/lib64 \
--with-zstd-include=/usr/include \
--with-zstd-lib=/usr/lib64 \
--with-rand-seed=os,devrandom \
no-afalgeng \
no-ktls \
no-asan \
no-acvp-tests \
enable-apps \
enable-asm \
no-async \
enable-autoalginit \
enable-autoerrinit \
no-brotli \
no-brotli-dynamic \
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
no-dgram \
no-docs \
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
no-http \
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
no-sm2-precomp \
enable-sock \
no-srp \
no-srtp \
enable-sse2 \
no-ssl-trace \
no-static-engine \
enable-stdio \
no-tests \
no-tfo \
no-quic \
enable-threads \
enable-thread-pool \
enable-default-thread-pool \
no-trace \
no-ts \
disable-ubsan \
no-ui-console \
no-unit-test \
no-uplink \
no-weak-ssl-ciphers \
enable-zlib \
no-zlib-dynamic \
no-zstd \
no-zstd-dynamic \
\
no-ssl \
no-ssl3 \
no-tls \
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
no-tls1_1-method \
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
no-chacha \
no-cmac \
no-des \
enable-dh \
no-dsa \
enable-ecdh \
enable-ecdsa \
no-idea \
no-md4 \
no-mdc2 \
no-ocb \
no-poly1305 \
no-rc2 \
no-rc4 \
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
src_install(){ make DESTDIR="${D}" install_sw install_ssldirs || die "install failed" ; rm "${D}/usr/bin/c_rehash" ; }
#############
