# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit wrapper

DESCRIPTION="Infinite canvas drawing/whiteboarding app."
HOMEPAGE="https://github.com/mbrlabs/Lorien"
SRC_URI="https://github.com/mbrlabs/Lorien/releases/download/v0.4.0/Lorien_v${PV}_Linux.tar.xz"
S="${WORKDIR}/Lorien_v${PV}_Linux"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mv Lorien lorien
	mv Lorien.pck lorien.pck
}

src_install() {
	local dir="/opt/${PN}"

	insinto ${dir}
	doins -r *

	fperms 755 ${dir}/lorien

	make_wrapper ${PN} ${dir}/lorien
}
