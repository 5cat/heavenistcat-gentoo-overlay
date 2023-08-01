# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Terraform Language Server"
HOMEPAGE="https://github.com/hashicorp/terraform-ls"
SRC_URI="
	https://github.com/hashicorp/terraform-ls/archive/refs/tags/v${PV}.tar.gz -> ${PN}.tar.gz
	https://github.com/5cat/heavenistcat-gentoo-overlay-artifacts/releases/download/terraform-ls-${PV}/terraform-ls-${PV}-vendor.tar.xz
"
# S="${WORKDIR}/${PN}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_compile() {
	ego build -mod=vendor
}

src_install() {
	default
	dobin terraform-ls
}
