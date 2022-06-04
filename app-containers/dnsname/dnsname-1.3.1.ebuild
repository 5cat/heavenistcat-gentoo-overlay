# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="name resolution for containers"
HOMEPAGE="https://github.com/containers/dnsname"
SRC_URI="https://github.com/containers/dnsname/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-dns/dnsmasq"
RDEPEND="${DEPEND}"
BDEPEND=""

# TODO: configure apparrmor stuff https://github.com/containers/dnsname/blob/main/README_PODMAN.md

src_compile() {
	emake binaries
}

src_install() {
	emake install PREFIX="${D}"/usr
}
