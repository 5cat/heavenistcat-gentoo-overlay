# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{7..12} )
inherit distutils-r1

DESCRIPTION="Python dependency management and packaging made easy."
HOMEPAGE="https://pypi.org/project/poetry"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	=dev-python/poetry-core-1.6.0[${PYTHON_USEDEP}]
	=dev-python/build-0*[${PYTHON_USEDEP}]
	=dev-python/cachecontrol-0*[${PYTHON_USEDEP}]
	=dev-python/cleo-2*[${PYTHON_USEDEP}]
	=dev-python/crashtest-0*[${PYTHON_USEDEP}]
	=dev-python/dulwich-0*[${PYTHON_USEDEP}]
	=dev-python/filelock-3*[${PYTHON_USEDEP}]
	=dev-python/html5lib-1*[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/importlib-metadata-4.4[${PYTHON_USEDEP}]
	' 3.10)
	=dev-python/installer-0*[${PYTHON_USEDEP}]
	=dev-python/jsonschema-4*[${PYTHON_USEDEP}]
	=dev-python/keyring-23*[${PYTHON_USEDEP}]
	=dev-python/lockfile-0*[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.4[${PYTHON_USEDEP}]
	=dev-python/pexpect-4*[${PYTHON_USEDEP}]
	=dev-python/pkginfo-1*[${PYTHON_USEDEP}]
	=dev-python/platformdirs-3*[${PYTHON_USEDEP}]
	=dev-python/pyproject-hooks-1*[${PYTHON_USEDEP}]
	=dev-python/requests-2*[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.9.1[${PYTHON_USEDEP}]
	<dev-python/requests-toolbelt-2[${PYTHON_USEDEP}]
	=dev-python/shellingham-1*[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		=dev-python/tomli-2*[${PYTHON_USEDEP}]
	' 3.11)
	>=dev-python/tomlkit-0.11.4[${PYTHON_USEDEP}]
	<dev-python/tomlkit-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/trove-classifiers-2022.5.19[${PYTHON_USEDEP}]
	=dev-python/virtualenv-20*[${PYTHON_USEDEP}]
	=dev-python/xattr-0*[${PYTHON_USEDEP}]
	=dev-python/urllib3-1*[${PYTHON_USEDEP}]"
BDEPEND="
	${RDEPEND}
"


src_install() {
	default
	echo $(pwd)
}
