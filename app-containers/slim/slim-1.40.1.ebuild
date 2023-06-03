# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Don't change anything in your container image and minify it by up to 30x"
HOMEPAGE="https://github.com/slimtoolkit/slim"
SRC_URI="https://github.com/slimtoolkit/slim/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake build_dev
}

src_install() {
	dobin bin/slim
	dobin bin/slim-sensor
}
