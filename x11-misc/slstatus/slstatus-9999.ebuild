# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit savedconfig git-r3 toolchain-funcs

DESCRIPTION="status monitor"
HOMEPAGE="https://tools.suckless.org/slstatus/"
EGIT_REPO_URI="https://git.suckless.org/slstatus"

LICENSE="ISC"
SLOT="0"
IUSE="savedconfig"

DEPEND="
	virtual/pkgconfig
	x11-base/xorg-proto
"
RDEPEND="
	${DEPEND}
	x11-libs/libX11
	x11-libs/libXft
	"
BDEPEND=""


src_prepare() {
	default
	sed -i \
		-e "s/ -Os / /" \
		-e "/^\(LDFLAGS\|CFLAGS\|CPPFLAGS\)/{s| = | += |g;s|-s ||g}" \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		-e "s/^LDFLAGS.*$/LDFLAGS  = -L\$(X11LIB)/" \
		config.mk || die

	restore_config config.h
}


src_compile() {
	emake CC=$(tc-getCC) slstatus
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	dodoc README
	save_config config.h
}
