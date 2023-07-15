# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Docker CLI plugin for extended build capabilities with BuildKit"
HOMEPAGE="https://github.com/docker/buildx"
SRC_URI="https://github.com/docker/buildx/releases/download/v${PV}/buildx-v${PV}.linux-amd64"

S="${WORKDIR}/docker-buildx-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	mkdir ${S}
	cp ${DISTDIR}/buildx-v${PV}.linux-amd64 ${S}/docker-buildx
}

src_install() {
	exeinto /usr/libexec/docker/cli-plugins
	doexe docker-buildx
}
