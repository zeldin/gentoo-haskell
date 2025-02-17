# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.9999
#hackport: flags: +split-these,-use-reflex-optimizer,debug-cycles:debug,debug-propagation:debug,debug-trace-events:debug,-fast-weak

CABAL_FEATURES="lib profile haddock hoogle hscolour" # test-suite fails to build on ghc-9
inherit haskell-cabal

DESCRIPTION="Higher-order Functional Reactive Programming"
HOMEPAGE="https://reflex-frp.org"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="debug +template-haskell"

RESTRICT=test # fails to build on ghc-9

RDEPEND=">=dev-haskell/bifunctors-5.2:=[profile?] <dev-haskell/bifunctors-5.6:=[profile?]
	>=dev-haskell/comonad-5.0.4:=[profile?] <dev-haskell/comonad-5.1:=[profile?]
	>=dev-haskell/constraints-0.10:=[profile?] <dev-haskell/constraints-0.14:=[profile?]
	>=dev-haskell/constraints-extras-0.3:=[profile?] <dev-haskell/constraints-extras-0.4:=[profile?]
	>=dev-haskell/data-default-0.5:=[profile?] <dev-haskell/data-default-0.8:=[profile?]
	>=dev-haskell/dependent-map-0.3:=[profile?] <dev-haskell/dependent-map-0.5:=[profile?]
	>=dev-haskell/dependent-sum-0.6:=[profile?] <dev-haskell/dependent-sum-0.8:=[profile?]
	>=dev-haskell/exception-transformers-0.4:=[profile?] <dev-haskell/exception-transformers-0.5:=[profile?]
	>=dev-haskell/lens-4.7:=[profile?]
	>=dev-haskell/memotrie-0.6:=[profile?] <dev-haskell/memotrie-0.7:=[profile?]
	>=dev-haskell/mmorph-1.0:=[profile?] <dev-haskell/mmorph-1.2:=[profile?]
	>=dev-haskell/monad-control-1.0.1:=[profile?] <dev-haskell/monad-control-1.1:=[profile?]
	>=dev-haskell/monoidal-containers-0.6:=[profile?] <dev-haskell/monoidal-containers-0.7:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/patch-0.0.1:=[profile?] <dev-haskell/patch-0.1:=[profile?]
	>=dev-haskell/prim-uniq-0.1.0.1:=[profile?] <dev-haskell/prim-uniq-0.3:=[profile?]
	>=dev-haskell/primitive-0.5:=[profile?] <dev-haskell/primitive-0.8:=[profile?]
	>=dev-haskell/profunctors-5.3:=[profile?] <dev-haskell/profunctors-5.7:=[profile?]
	>=dev-haskell/random-1.1:=[profile?] <dev-haskell/random-1.3:=[profile?]
	>=dev-haskell/ref-tf-0.4:=[profile?]
	>=dev-haskell/reflection-2.1:=[profile?] <dev-haskell/reflection-2.2:=[profile?]
	>=dev-haskell/semialign-1:=[profile?]
	>=dev-haskell/semigroupoids-4.0:=[profile?] <dev-haskell/semigroupoids-6:=[profile?]
	>=dev-haskell/stm-2.4:=[profile?] <dev-haskell/stm-2.6:=[profile?]
	>=dev-haskell/syb-0.5:=[profile?] <dev-haskell/syb-0.8:=[profile?]
	>=dev-haskell/these-1:=[profile?] <dev-haskell/these-1.2:=[profile?]
	>=dev-haskell/unbounded-delays-0.1.0.0:=[profile?] <dev-haskell/unbounded-delays-0.2:=[profile?]
	>=dev-haskell/witherable-0.3:=[profile?]
	>=dev-lang/ghc-8.6.5:=
	template-haskell? ( >=dev-haskell/haskell-src-exts-1.16:=[profile?] <dev-haskell/haskell-src-exts-1.24:=[profile?]
				>=dev-haskell/haskell-src-meta-0.6:=[profile?] <dev-haskell/haskell-src-meta-0.9:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.4.0.1"
# 	test? ( dev-haskell/filemanip
# 		<dev-haskell/hlint-4
# 		dev-haskell/hspec
# 		dev-haskell/proctest
# 		dev-haskell/split
# 		dev-haskell/text
# 		dev-haskell/these-lens )
# "

src_prepare() {
	cabal_chdeps \
		'lens >= 4.7 && < 5' 'lens >= 4.7' \
		'ref-tf == 0.4.*' 'ref-tf >=0.4' \
		'semialign >=1 && <1.2' 'semialign >=1' \
		'base >= 4.11 && < 4.15' 'base >= 4.11' \
		'random == 1.1.*' 'random >= 1.1' \
		'template-haskell >= 2.9 && < 2.17' 'template-haskell >= 2.9' \
		'witherable >= 0.3 && < 0.4' 'witherable >=0.3'
	default
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag debug debug-cycles) \
		$(cabal_flag debug debug-propagation) \
		$(cabal_flag debug debug-trace-events) \
		--flag=-fast-weak \
		--flag=split-these \
		--flag=-use-reflex-optimizer \
		$(cabal_flag template-haskell use-template-haskell)
}
