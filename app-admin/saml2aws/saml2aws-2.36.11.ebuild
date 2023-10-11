# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CLI tool which enables you to login using a SAML IDP"
HOMEPAGE="https://github.com/Versent/saml2aws"
SRC_URI="https://github.com/Versent/saml2aws/releases/download/v${PV}/saml2aws_${PV}_linux_amd64.tar.gz"

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
