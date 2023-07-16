# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{7..12} )
inherit distutils-r1 pypi

DESCRIPTION="Poetry plugin to export the dependencies to various formats"
HOMEPAGE="https://pypi.org/project/poetry-plugin-export"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	=dev-python/poetry-1*[${PYTHON_USEDEP}]
	=dev-python/poetry-core-1*[${PYTHON_USEDEP}]"
BDEPEND="
	${RDEPEND}
"

src_unpack() {
	default
	mv $WORKDIR/poetry_plugin_export-${PV} poetry-plugin-export-${PV}
}
