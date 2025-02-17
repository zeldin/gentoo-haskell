# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Render tasty output to XML for Jenkins"
HOMEPAGE="https://github.com/ocharles/tasty-ant-xml"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-haskell/generic-deriving-1.6.2:=[profile?]
	>=dev-haskell/stm-2.4.2:=[profile?]
	>=dev-haskell/tagged-0.7:=[profile?]
	>=dev-haskell/tasty-1.4:=[profile?] <dev-haskell/tasty-1.5:=[profile?]
	>=dev-haskell/xml-1.3.13:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"
