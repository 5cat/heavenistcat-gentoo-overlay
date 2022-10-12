# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="Python API to MPV using JSON IPC"
HOMEPAGE="
	https://github.com/iwalton3/python-mpv-jsonipc
	https://pypi.org/project/python-mpv-jsonipc/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
BDEPEND=""