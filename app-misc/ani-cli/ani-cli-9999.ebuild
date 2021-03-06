# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A cli to browse and watch anime."
HOMEPAGE="https://github.com/pystardust/ani-cli/"
EGIT_REPO_URI="https://github.com/pystardust/ani-cli.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-video/mpv
	dev-libs/openssl
	net-misc/curl
	media-video/ffmpeg
	net-misc/aria2"

RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ani-cli
}
