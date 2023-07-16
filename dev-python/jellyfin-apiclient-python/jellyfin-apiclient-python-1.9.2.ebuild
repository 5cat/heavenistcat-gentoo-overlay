# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Python API Client for Jellyfin"
HOMEPAGE="
	https://github.com/jellyfin/jellyfin-apiclient-python
	https://pypi.org/project/jellyfin-apiclient-python/
"


LICENSE="GPLv3"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
"
BDEPEND=""

