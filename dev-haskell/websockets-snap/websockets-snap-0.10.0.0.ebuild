# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Snap integration for the websockets library"
HOMEPAGE="http://hackage.haskell.org/package/websockets-snap"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/io-streams-1.3:=[profile?] <dev-haskell/io-streams-1.4:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/snap-core-1.0:=[profile?] <dev-haskell/snap-core-1.1:=[profile?]
	>=dev-haskell/snap-server-1.0:=[profile?] <dev-haskell/snap-server-1.1:=[profile?]
	>=dev-haskell/websockets-0.9.5:=[profile?] <dev-haskell/websockets-0.10:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"
