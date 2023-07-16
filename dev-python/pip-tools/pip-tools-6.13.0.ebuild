# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="A set of tools to keep your pinned Python dependencies fresh."
HOMEPAGE="
	https://pypi.org/project/pip-tools/
"


RESTRICT="test"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/build[${PYTHON_USEDEP}]
	>=dev-python/click-8[${PYTHON_USEDEP}]
	>=dev-python/pip-2.22[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"
