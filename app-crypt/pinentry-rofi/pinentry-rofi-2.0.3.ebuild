# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Rofi frontend to pinentry"
HOMEPAGE="https://github.com/plattfot/pinentry-rofi"
SRC_URI="https://github.com/plattfot/pinentry-rofi/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
FEATURES="test"

DEPEND="x11-misc/rofi"
RDEPEND="${DEPEND}"
BDEPEND="dev-scheme/guile"


src_configure() {
	autoreconf -vif
	./configure --prefix=${D}
}

src_compile() {
	make all
}

src_test() {
	make check
}

src_install () {
	make install
}
