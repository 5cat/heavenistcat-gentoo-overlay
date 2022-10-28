# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Open and extensible continuous delivery solution for Kubernetes"
HOMEPAGE="https://github.com/fluxcd/flux2"
SRC_URI="https://github.com/fluxcd/flux2/releases/download/v${PV}/flux_${PV}_linux_amd64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_unpack() {
	default
	mkdir ${WORKDIR}/${P}
	mv ${WORKDIR}/${PN} ${WORKDIR}/${P}/${PN}
}


src_compile() {
	default
	chmod u+x ${PN}
	./${PN} completion zsh > _${PN}
}


src_install() {
	dobin ${PN}
	insinto /usr/share/zsh/site-functions
	doins _${PN}
}
