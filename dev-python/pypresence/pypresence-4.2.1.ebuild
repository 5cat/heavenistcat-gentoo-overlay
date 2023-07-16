# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1 pypi

DESCRIPTION="A complete Discord IPC and Rich Presence wrapper library in Python!"
HOMEPAGE="
	https://github.com/qwertyquerty/pypresence
	https://pypi.org/project/pypresence/
"


LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
BDEPEND=""
