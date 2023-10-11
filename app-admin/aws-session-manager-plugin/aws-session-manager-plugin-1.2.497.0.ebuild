# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="AWS CLI plugin to start and end sessions to your managed instances"
HOMEPAGE="https://github.com/aws/session-manager-plugin"
SRC_URI="https://github.com/aws/session-manager-plugin/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

src_unpack() {
	default
	mv ${WORKDIR}/session-manager-plugin-${PV} ${WORKDIR}/aws-session-manager-plugin-${PV}
}

src_prepare() {
	default
	rm ${WORKDIR}/aws-session-manager-plugin-${PV}/Tools/src/checkstyle.sh || die
	touch ${WORKDIR}/aws-session-manager-plugin-${PV}/Tools/src/checkstyle.sh || die
	chmod +x ${WORKDIR}/aws-session-manager-plugin-${PV}/Tools/src/checkstyle.sh || die
}

src_compile() {
	emake build-linux-amd64 GO_BUILD='go build'
}

src_test() {
	emake quick-test
}

src_install() {
	echo "install"
	dobin bin/linux_amd64_plugin/session-manager-plugin
}
