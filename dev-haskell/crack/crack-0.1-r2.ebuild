# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.3.1

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A haskell binding to cracklib"
HOMEPAGE="https://hackage.haskell.org/package/crack"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.10.4:=
	sys-libs/cracklib"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.2.0"

PATCHES=("${FILESDIR}"/${PN}-0.1-ghc-7.8.patch)

src_prepare() {
	default

	rm Setup.lhs || die
}
