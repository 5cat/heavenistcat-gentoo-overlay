# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

JAVA_PKG_IUSE="doc source"

inherit wrapper java-pkg-2

DESCRIPTION="Spelling, grammar and style checking on LaTeX documents "
HOMEPAGE="https://github.com/sylvainhalle/textidote"
SRC_URI="https://github.com/sylvainhalle/textidote/releases/download/v${PV}/textidote.jar"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="amd64"

COMMON_DEP=""
DEPEND=">=virtual/jdk-1.7
	${COMMON_DEP}"
RDEPEND=">=virtual/jre-1.7
	${COMMON_DEP}"
BDEPEND=""

src_unpack() {
	mkdir -p $S
	cp $DISTDIR/textidote.jar $S || die
}

src_install() {
	java-pkg_newjar textidote.jar
	java-pkg_dolauncher textidote
}
