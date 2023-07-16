# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1 pypi

DESCRIPTION="This library allows you to create a system tray icon"
HOMEPAGE="
	https://github.com/moses-palmer/pystray
	https://pypi.org/project/pystray/
"


LICENSE="LGBLv3"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/python-xlib-0.17[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests unittest
