# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="simple pinentry implementation using rofi"
HOMEPAGE="https://github.com/zamlz/pinentry-rofi.git"
EGIT_REPO_URI="https://github.com/zamlz/pinentry-rofi.git"

LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	true
}

src_install() {
	emake PREFIX="${D}/usr" install
}
