# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit wrapper

DESCRIPTION="A privacy-first, open-source platform for knowledge management and collaboration"
HOMEPAGE="https://github.com/logseq/logseq"
SRC_URI="https://github.com/logseq/logseq/releases/download/${PV}/Logseq-linux-x64-${PV}.zip"
S="${WORKDIR}/Logseq-linux-x64"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_install() {
	local dir="/opt/${PN}"

	insinto ${dir}
	doins -r *
	fperms 755 ${dir}/Logseq

	make_wrapper ${PN} ${dir}/Logseq
}
