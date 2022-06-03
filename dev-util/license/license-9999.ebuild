# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module git-r3

EGIT_REPO_URI="https://github.com/nishanths/license.git"

DESCRIPTION=" Command-line license text generator."
HOMEPAGE="https://github.com/nishanths/license"
DOCS=( README.md )

LICENSE="MIT"
SLOT="0"

RESTRICT+="test"

src_unpack() {
	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	default
	ego build
}

src_install() {
	dobin license
	default
}
