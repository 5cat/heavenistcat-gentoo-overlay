# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aes-0.7.5
	aho-corasick-0.7.18
	ansi_term-0.12.1
	anyhow-1.0.53
	arrayvec-0.7.2
	async-trait-0.1.52
	atty-0.2.14
	autocfg-0.1.8
	autocfg-1.1.0
	base32-0.4.0
	base64-0.13.0
	base64ct-1.0.1
	bitflags-1.3.2
	block-buffer-0.9.0
	block-modes-0.8.1
	block-padding-0.2.1
	boxfnonce-0.1.1
	bumpalo-3.9.1
	byteorder-1.4.3
	bytes-1.1.0
	cc-1.0.72
	cfg-if-1.0.0
	cipher-0.3.0
	clap-2.34.0
	const-oid-0.6.2
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	cpufeatures-0.2.1
	crypto-bigint-0.2.11
	crypto-mac-0.11.1
	daemonize-0.4.1
	der-0.4.5
	digest-0.9.0
	directories-4.0.1
	dirs-sys-0.3.6
	encoding_rs-0.8.30
	env_logger-0.9.0
	fastrand-1.7.0
	fnv-1.0.7
	form_urlencoded-1.0.1
	futures-channel-0.3.21
	futures-core-0.3.21
	futures-io-0.3.21
	futures-sink-0.3.21
	futures-task-0.3.21
	futures-util-0.3.21
	generic-array-0.14.5
	getrandom-0.2.4
	h2-0.3.11
	hashbrown-0.11.2
	heck-0.3.3
	hermit-abi-0.1.19
	hkdf-0.11.0
	hmac-0.11.0
	http-0.2.6
	http-body-0.4.4
	httparse-1.6.0
	httpdate-1.0.2
	humantime-2.1.0
	hyper-0.14.16
	hyper-rustls-0.23.0
	idna-0.2.3
	indexmap-1.8.0
	instant-0.1.12
	ipnet-2.3.1
	itoa-0.4.8
	itoa-1.0.1
	js-sys-0.3.56
	lazy_static-1.4.0
	libc-0.2.117
	libm-0.2.2
	lock_api-0.4.6
	log-0.4.14
	mach-0.3.2
	matches-0.1.9
	memchr-2.4.1
	memoffset-0.6.5
	mime-0.3.16
	mio-0.7.14
	miow-0.3.7
	nix-0.23.1
	ntapi-0.3.6
	num-bigint-dig-0.7.0
	num-integer-0.1.44
	num-iter-0.1.42
	num-traits-0.2.14
	num_cpus-1.13.1
	once_cell-1.9.0
	opaque-debug-0.3.0
	openssl-probe-0.1.5
	parking_lot-0.11.2
	parking_lot_core-0.8.5
	password-hash-0.3.2
	paw-1.0.0
	paw-attributes-1.0.2
	paw-raw-1.0.0
	pbkdf2-0.9.0
	pem-rfc7468-0.2.4
	percent-encoding-2.1.0
	pin-project-lite-0.2.8
	pin-utils-0.1.0
	pkcs1-0.2.4
	pkcs8-0.7.6
	ppv-lite86-0.2.16
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.36
	quote-1.0.15
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	rbw-1.4.3
	redox_syscall-0.2.10
	redox_users-0.4.0
	regex-1.5.4
	regex-syntax-0.6.25
	region-3.0.0
	remove_dir_all-0.5.3
	reqwest-0.11.9
	ring-0.16.20
	rsa-0.5.0
	rustls-0.20.2
	rustls-native-certs-0.6.1
	rustls-pemfile-0.2.1
	ryu-1.0.9
	schannel-0.1.19
	scopeguard-1.1.0
	sct-0.7.0
	security-framework-2.6.1
	security-framework-sys-2.6.1
	serde-1.0.136
	serde_derive-1.0.136
	serde_json-1.0.78
	serde_path_to_error-0.1.7
	serde_repr-0.1.7
	serde_urlencoded-0.7.1
	sha-1-0.9.8
	sha2-0.9.9
	signal-hook-registry-1.4.0
	slab-0.4.5
	smallvec-1.8.0
	socket2-0.4.4
	spin-0.5.2
	spki-0.4.1
	strsim-0.8.0
	structopt-0.3.26
	structopt-derive-0.4.18
	subtle-2.4.1
	syn-1.0.86
	synstructure-0.12.6
	tempfile-3.3.0
	term_size-0.3.2
	termcolor-1.1.2
	textwrap-0.11.0
	thiserror-1.0.30
	thiserror-impl-1.0.30
	tinyvec-1.5.1
	tinyvec_macros-0.1.0
	tokio-1.16.1
	tokio-macros-1.7.0
	tokio-rustls-0.23.2
	tokio-util-0.6.9
	totp-lite-1.0.3
	tower-service-0.3.1
	tracing-0.1.30
	tracing-core-0.1.22
	try-lock-0.2.3
	typenum-1.15.0
	unicode-bidi-0.3.7
	unicode-normalization-0.1.19
	unicode-segmentation-1.9.0
	unicode-width-0.1.9
	unicode-xid-0.2.2
	untrusted-0.7.1
	url-2.2.2
	uuid-0.8.2
	vec_map-0.8.2
	version_check-0.9.4
	want-0.3.0
	wasi-0.10.2+wasi-snapshot-preview1
	wasm-bindgen-0.2.79
	wasm-bindgen-backend-0.2.79
	wasm-bindgen-futures-0.4.29
	wasm-bindgen-macro-0.2.79
	wasm-bindgen-macro-support-0.2.79
	wasm-bindgen-shared-0.2.79
	web-sys-0.3.56
	webpki-0.22.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	winreg-0.7.0
	zeroize-1.4.3
	zeroize_derive-1.3.1
"

inherit bash-completion-r1 cargo

DESCRIPTION="Unofficial bitwarden cli written in rust"
HOMEPAGE="https://github.com/doy/rbw"
SRC_URI="https://github.com/doy/rbw/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-crypt/pinentry
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	cargo_src_unpack
}

src_configure() {
	cargo_src_configure
}

src_install() {
	cargo_src_install

	./target/release/rbw gen-completions bash > rbw.bash
	newbashcomp rbw.bash rbw

	./target/release/rbw gen-completions zsh > _zsh
	insinto /usr/share/zsh/site-functions
	doins _zsh

	./target/release/rbw gen-completions fish > rbw.fish
	insinto /usr/share/fish/vendor_completions.d/
	doins rbw.fish
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog "Before using rbw, you must configure the email address you would like to use to log in to the server by running:"
		elog "	\"rbw config set email <email>\""
		elog "Additionally, if you are using a self-hosted installation, you should run:"
		elog "	\"rbw config set base_url <url>\""
		elog "and, if your server has a non-default identity url:"
		elog "	\"rbw config set identity_url <url>\""
	fi
}
