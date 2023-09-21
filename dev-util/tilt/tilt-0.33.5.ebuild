# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Define your dev environment as code. For microservice apps on Kubernetes."
HOMEPAGE="https://github.com/tilt-dev/tilt"
SRC_URI="https://github.com/tilt-dev/tilt/releases/download/v${PV}/tilt.${PV}.linux.x86_64.tar.gz"

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
