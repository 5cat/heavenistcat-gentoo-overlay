# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop readme.gentoo-r1 wrapper xdg

MY_PN=${PN/-professional/}
DESCRIPTION="Intelligent Python IDE with unique code assistance and analysis"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="PyCharm_Academic PyCharm_Classroom PyCharm PyCharm_OpenSource PyCharm_Preview"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bundled-jdk"
RESTRICT="mirror"

RDEPEND="!bundled-jdk? ( >=virtual/jre-1.8 )
	app-arch/brotli
	app-arch/zstd
	app-crypt/p11-kit
	dev-libs/fribidi
	dev-libs/glib
	dev-libs/json-c
	dev-libs/libbsd
	dev-libs/libdbusmenu
	dev-libs/nss
	dev-python/pip
	media-fonts/dejavu
	media-gfx/graphite2
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype:2=
	media-libs/harfbuzz
	media-libs/libglvnd
	media-libs/libpng:0=
	net-libs/gnutls
	net-print/cups
	sys-apps/dbus
	sys-libs/libcap
	sys-libs/libselinux
	sys-libs/zlib
	sys-process/audit
	virtual/jpeg:0=
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/pango
"
BDEPEND="dev-util/patchelf"


QA_PREBUILT="opt/${PN}/*"


src_prepare() {
	default

	rm -v help/ReferenceCardForMac.pdf || die
	rm -v plugins/performanceTesting/bin/libyjpagent.so || die
	rm -v plugins/performanceTesting/bin/*.dll || die
	rm -v plugins/performanceTesting/bin/libyjpagent.dylib || die
	rm -vr lib/pty4j-native/linux/{aarch64,arm,mips64el,ppc64le,x86} || die
	rm -v plugins/python/helpers/pydev/pydevd_attach_to_process/attach_linux_x86.so || die
	rm -vr plugins/wsl-fs-helper || die

	sed -i \
		-e "\$a\\\\" \
		-e "\$a#-----------------------------------------------------------------------" \
		-e "\$a# Disable automatic updates as these are handled through Gentoo's" \
		-e "\$a# package manager. See bug #704494" \
		-e "\$a#-----------------------------------------------------------------------" \
		-e "\$aide.no.platform.update=Gentoo" \
		bin/idea.properties || die

	for file in "jbr/lib/"/{libjcef.so,jcef_helper}
	do
		if [[ -f "${file}" ]]; then
			patchelf --set-rpath '$ORIGIN' ${file} || die
		fi
	done
}

src_install() {
	local DIR="/opt/${PN}"
	local JRE_DIR="jbr"

	insinto ${DIR}
	doins -r *

	if ! use bundled-jdk; then
		rm -r "${JRE_DIR}" || die
	fi

	fperms 755 "${DIR}"/bin/{format.sh,fsnotifier,inspect.sh,ltedit.sh,printenv.py,pycharm.sh,restart.py}

	fperms 755 "${DIR}"/"${JRE_DIR}"/bin/{jaotc,java,javac,jcmd,jdb,jfr,jhsdb,jinfo,jjs,jmap,jps,jrunscript,jstack,jstat,keytool,pack200,rmid,rmiregistry,serialver,unpack200}
	fperms 755 "${DIR}"/"${JRE_DIR}"/lib/{chrome-sandbox,jcef_helper,jexec,jspawnhelper}

	make_wrapper "${PN}" "${DIR}/bin/pycharm.sh"
	newicon bin/${MY_PN}.png ${PN}.png
	make_desktop_entry ${PN} ${PN} ${PN}

	readme.gentoo_create_doc

	# recommended by: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	insinto /usr/lib/sysctl.d
	newins - 30-idea-inotify-watches.conf <<<"fs.inotify.max_user_watches = 524288"
}

pkg_postinst() {
	xdg_pkg_postinit
	readme.gentoo_print_elog
}
