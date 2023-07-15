# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Define and run multi-container applications with Docker"
HOMEPAGE="https://github.com/docker/compose"
SRC_URI="
	https://github.com/docker/compose/archive/refs/tags/v${PV}.tar.gz -> docker-plugin-compose-${PV}.tar.gz
	https://github.com/5cat/heavenistcat-gentoo-overlay-artifacts/releases/download/docker-plugin-compose-2.20.0/docker-plugin-compose-2.20.0-vendor.tar.xz
"

S="${WORKDIR}/docker-plugin-compose-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	default
	mv ${WORKDIR}/compose-${PV}/* ${S}
	# mkdir ${S}
	# cp ${DISTDIR}/compose-v${PV}.linux-amd64 ${S}/docker-plugin-compose-${PV}
}

src_compile() {
	# sed -i 's/GO_LDFLAGS ?= -w/GO_LDFLAGS ?= /' Makefile
	# export BUILD_FLAGS="-mod=vendor"
	# export VERSION=${PV}
	# export GO111MODULE=on
	# make build
	ego build -mod=vendor -ldflags "-X github.com/docker/compose/v2/internal.Version=${PV}" -o "./bin/build/docker-compose" ./cmd
}

src_install() {
	exeinto /usr/libexec/docker/cli-plugins
	doexe bin/build/docker-compose
}
