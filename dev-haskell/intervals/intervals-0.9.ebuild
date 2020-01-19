# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.1.9999
#hackport: flags: -herbie

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Interval Arithmetic"
HOMEPAGE="https://github.com/ekmett/intervals"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+test-doctests"

RESTRICT=test # broken on USE=doc

RDEPEND=">=dev-haskell/distributive-0.2:=[profile?] <dev-haskell/distributive-1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	>=dev-haskell/cabal-doctest-1 <dev-haskell/cabal-doctest-1.1
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-herbie \
		$(cabal_flag test-doctests test-doctests)
}