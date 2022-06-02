# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_SUM=(
	"github.com/nishanths/go-hgconfig v1.0.1"
	"github.com/nishanths/go-hgconfig v1.0.1/go.mod"
	"github.com/tcnksm/go-gitconfig v0.1.2"
	"github.com/tcnksm/go-gitconfig v0.1.2/go.mod"
)

go-module_set_globals

DESCRIPTION=" Command-line license text generator."
HOMEPAGE="https://github.com/nishanths/license"
SRC_URI="https://github.com/nishanths/license/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+="${EGO_SUM_SRC_URI}"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT+=" test"


src_compile() {
	ego build
}

src_install() {
	dobin license

	default
}

