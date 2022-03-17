# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour" # test-suite
inherit haskell-cabal
RESTRICT="test" # Tests fail to compile

DESCRIPTION="JavaScript parser and pretty-printer library"
HOMEPAGE="https://github.com/jswebtools/language-ecmascript"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-haskell/ansi-wl-pprint-0.6:=[profile?] <dev-haskell/ansi-wl-pprint-1:=[profile?]
	>=dev-haskell/charset-0.3:=[profile?]
	>=dev-haskell/data-default-class-0.0.1:=[profile?] <dev-haskell/data-default-class-0.2:=[profile?]
	>=dev-haskell/diff-0.4:=[profile?] <dev-haskell/diff-0.5:=[profile?]
	>=dev-haskell/quickcheck-2.5:2=[profile?] <dev-haskell/quickcheck-3:2=[profile?]
	>=dev-haskell/uniplate-1.6:=[profile?] <dev-haskell/uniplate-1.7:=[profile?]
	>=dev-lang/ghc-8.4.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"
#	test? ( >=dev-haskell/hunit-1.2 <dev-haskell/hunit-1.7
#		>=dev-haskell/test-framework-0.8 <dev-haskell/test-framework-0.9
#		>=dev-haskell/test-framework-hunit-0.3.0 <dev-haskell/test-framework-hunit-0.4
#		>=dev-haskell/test-framework-quickcheck2-0.3.0.1 <dev-haskell/test-framework-quickcheck2-0.4
#		>=dev-haskell/testing-feat-0.4.0.2 <dev-haskell/testing-feat-1.2 )

src_prepare() {
	default

	cabal_chdeps \
		'base >= 4 && < 4.15' 'base >= 4' \
		'base >= 4 && < 4.14' 'base >= 4'
}