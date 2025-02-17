# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1.9999
#hackport: flags: -all_extensions,+with_threaded,+with_utf8,with_iwlib:wifi,with_alsa:alsa,with_xft:xft,with_datezone:timezone,with_dbus:dbus,with_mpd:mpd,with_inotify:inotify,with_mpris:mpris,with_xpm:xpm

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit git-r3 haskell-cabal

DESCRIPTION="A Minimalistic Text Based Status Bar"
HOMEPAGE="https://xmobar.org"
#SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"
EGIT_REPO_URI="https://codeberg.org/xmobar/xmobar"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS=""
IUSE="alsa dbus inotify mpd mpris +rtsopts timezone uvmeter +weather wifi xft xpm"

RDEPEND="dev-haskell/async:=[profile?]
	>=dev-haskell/extensible-exceptions-0.1:=[profile?] <dev-haskell/extensible-exceptions-0.2:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	dev-haskell/old-locale:=[profile?]
	>=dev-haskell/parsec-3.1:=[profile?] <dev-haskell/parsec-3.2:=[profile?]
	>=dev-haskell/parsec-numbers-0.1.0:=[profile?]
	dev-haskell/regex-compat:=[profile?]
	>=dev-haskell/stm-2.3:=[profile?] <dev-haskell/stm-2.6:=[profile?]
	>=dev-haskell/utf8-string-0.3:=[profile?] <dev-haskell/utf8-string-1.1:=[profile?]
	>=dev-haskell/x11-1.6.1:=[profile?]
	>=dev-lang/ghc-8.0.2:=
	x11-libs/libXrandr
	x11-libs/libXrender
	alsa? ( >=dev-haskell/alsa-core-0.5:=[profile?] <dev-haskell/alsa-core-0.6:=[profile?]
		>=dev-haskell/alsa-mixer-0.3:=[profile?] <dev-haskell/alsa-mixer-0.4:=[profile?] )
	dbus? ( >=dev-haskell/dbus-1:=[profile?]
		weather? ( dev-haskell/http-conduit:=[profile?]
				dev-haskell/http-types:=[profile?] ) )
	!dbus? ( !uvmeter? ( weather? ( !xpm? ( dev-haskell/http-conduit:=[profile?]
						dev-haskell/http-types:=[profile?] ) ) ) )
	inotify? ( >=dev-haskell/hinotify-0.3:=[profile?] <dev-haskell/hinotify-0.5:=[profile?] )
	mpd? ( >=dev-haskell/libmpd-0.9.0.10:=[profile?] )
	mpris? ( >=dev-haskell/dbus-1:=[profile?]
			!dbus? ( !uvmeter? ( weather? ( dev-haskell/http-conduit:=[profile?]
							dev-haskell/http-types:=[profile?] ) ) )
			weather? ( xpm? ( dev-haskell/http-conduit:=[profile?]
					dev-haskell/http-types:=[profile?] ) ) )
	!mpris? ( !dbus? ( weather? ( xpm? ( dev-haskell/http-conduit:=[profile?]
						dev-haskell/http-types:=[profile?] ) ) ) )
	timezone? ( >=dev-haskell/timezone-olson-0.2:=[profile?] <dev-haskell/timezone-olson-0.3:=[profile?]
			>=dev-haskell/timezone-series-0.1:=[profile?] <dev-haskell/timezone-series-0.2:=[profile?] )
	uvmeter? ( dev-haskell/http-conduit:=[profile?]
			dev-haskell/http-types:=[profile?] )
	wifi? ( >=dev-haskell/iwlib-0.1.0:=[profile?] <dev-haskell/iwlib-0.2:=[profile?]
		net-wireless/wireless-tools )
	xft? ( >=dev-haskell/x11-xft-0.2:=[profile?] <dev-haskell/x11-xft-0.4:=[profile?] )
	xpm? ( x11-libs/libXpm )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.24.2.0
	test? ( >=dev-haskell/hspec-2 <dev-haskell/hspec-3
		dev-haskell/temporary )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-all_extensions \
		$(cabal_flag alsa with_alsa) \
		$(cabal_flag timezone with_datezone) \
		$(cabal_flag dbus with_dbus) \
		$(cabal_flag inotify with_inotify) \
		$(cabal_flag wifi with_iwlib) \
		$(cabal_flag mpd with_mpd) \
		$(cabal_flag mpris with_mpris) \
		$(cabal_flag rtsopts with_rtsopts) \
		--flag=with_threaded \
		--flag=with_utf8 \
		$(cabal_flag uvmeter with_uvmeter) \
		$(cabal_flag weather with_weather) \
		$(cabal_flag xft with_xft) \
		$(cabal_flag xpm with_xpm)
}

src_install() {
	haskell-cabal_src_install

	dodoc examples/xmobar.config readme.org changelog.md
}
