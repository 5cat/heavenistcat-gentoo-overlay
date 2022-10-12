# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="A complete Discord IPC and Rich Presence wrapper library in Python!"
HOMEPAGE="
	https://github.com/qwertyquerty/pypresence
	https://pypi.org/project/pypresence/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
BDEPEND=""
