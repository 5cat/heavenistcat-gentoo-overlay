# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="A script to run docker-compose.yml using podman"
HOMEPAGE="https://github.com/containers/podman-compose"
SRC_URI="https://github.com/containers/podman-compose/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}
		test? (
			dev-python/pytest[${PYTHON_USEDEP}]
			)"
BDEPEND="test? ( ${RDEPEND} )"

DOCS=( README.md )

distutils_enable_tests pytest

python_test() {
	epytest tests
}
