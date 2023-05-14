# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..11} )
inherit distutils-r1

RESTRICT="test"

DESCRIPTION="Generate and change color-schemes on the fly. "
HOMEPAGE="
	https://github.com/dylanaraps/pywal
	https://pypi.org/project/pywal/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
BDEPEND=""

