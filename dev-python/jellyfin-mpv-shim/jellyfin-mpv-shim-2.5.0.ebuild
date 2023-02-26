# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
PYTHON_REQ_USE="tk?"

inherit distutils-r1

DESCRIPTION="MPV Cast Client for Jellyfin"
HOMEPAGE="
	https://github.com/jellyfin/jellyfin-mpv-shim
	https://pypi.org/project/jellyfin-mpv-shim/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="amd64"
IUSE="+gui mirror discord +tk"

REQUIRED_USE="${PYTHON_REQUIRED_USE}
	tk? ( gui )
	gui? ( tk )
"

RDEPEND="
	dev-python/python-mpv[${PYTHON_USEDEP}]
	>=dev-python/jellyfin-apiclient-python-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/python-mpv-jsonipc-1.2.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	gui? (
		dev-python/pystray[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/pillow[tk?,${PYTHON_USEDEP}]
		')
	)
	mirror? (
		dev-python/jinja[${PYTHON_USEDEP}]
		>=dev-python/pywebview-3.3.1[${PYTHON_USEDEP}]
	)
	discord? (
		dev-python/pypresence[${PYTHON_USEDEP}]
	)
"
BDEPEND=""
