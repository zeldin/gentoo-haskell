# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Prettyprint and compare Data values"
HOMEPAGE="https://hackage.haskell.org/package/data-pprint"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/mtl-2.0:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/parallel-3.1:=[profile?] <dev-haskell/parallel-3.3:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

PATCHES=(
	"${FILESDIR}"/${P}-ghc84.patch
)

src_prepare() {
	default

	cabal_chdeps \
		'time >= 1.2 && < 1.6' 'time >= 1.2' \
		'base >= 4.0 && < 4.10' 'base >= 4.0'
}
