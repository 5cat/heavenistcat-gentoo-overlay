# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="cli tool to manage talos linux distrubtion for kubernetes"
HOMEPAGE="https://github.com/siderolabs/talos"
SRC_URI="https://github.com/siderolabs/talos/releases/download/v${PV}/talosctl-linux-amd64 -> ${P}"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_unpack() {
	mkdir ${WORKDIR}/${P}
	cp ${DISTDIR}/${P} ${WORKDIR}/${P}/${PN}
	ls -al
}

src_compile() {
	default
	chmod u+x ${PN}
	./${PN} completion zsh > _talosctl
}

src_install() {
	dobin ${PN}
	insinto /usr/share/zsh/site-functions
	dobin _talosctl
}
