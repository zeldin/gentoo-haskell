# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.5
#hackport: flags: -devel

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal git-r3

DESCRIPTION="Predicate Abstraction-based Horn-Clause/Implication Constraint Solver"
HOMEPAGE="https://github.com/ucsd-progsys/liquid-fixpoint"
EGIT_REPO_URI="https://github.com/ucsd-progsys/liquid-fixpoint.git"
EGIT_BRANCH="develop"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS=""
IUSE=""

RESTRICT=test # fails tests, needs investigation

RDEPEND="dev-haskell/ansi-terminal:=[profile?]
	>=dev-haskell/ascii-progress-0.3:=[profile?]
	dev-haskell/async:=[profile?]
	dev-haskell/attoparsec:=[profile?]
	dev-haskell/bifunctors:=[profile?]
	dev-haskell/binary:=[profile?]
	dev-haskell/boxes:=[profile?]
	dev-haskell/cereal:=[profile?]
	dev-haskell/cmdargs:=[profile?]
	dev-haskell/dotgen:=[profile?]
	dev-haskell/fgl:=[profile?]
	dev-haskell/fgl-visualize:=[profile?]
	dev-haskell/filemanip:=[profile?]
	dev-haskell/hashable:=[profile?]
	dev-haskell/intern:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/parallel:=[profile?]
	dev-haskell/parsec:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/text-format:=[profile?]
	dev-haskell/transformers:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-lang/ghc-7.8.2:=
	|| ( sci-mathematics/z3 sci-mathematics/cvc4 )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( >=dev-haskell/tasty-0.10
		dev-haskell/tasty-hunit
		>=dev-haskell/tasty-rerun-1.1 )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-devel
}
