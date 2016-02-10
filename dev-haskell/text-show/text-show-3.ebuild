# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.7.9999
#hackport: flags: -developer

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Efficient conversion of values into Text"
HOMEPAGE="https://github.com/RyanGlScott/text-show"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/base-compat-0.8.1:=[profile?] <dev-haskell/base-compat-1:=[profile?]
	>=dev-haskell/bifunctors-5.1:=[profile?] <dev-haskell/bifunctors-6:=[profile?]
	dev-haskell/bytestring-builder:=[profile?]
	>=dev-haskell/generic-deriving-1.9:=[profile?] <dev-haskell/generic-deriving-2:=[profile?]
	>=dev-haskell/nats-0.1:=[profile?] <dev-haskell/nats-2:=[profile?]
	>=dev-haskell/semigroups-0.17:=[profile?] <dev-haskell/semigroups-1:=[profile?]
	>=dev-haskell/tagged-0.4.4:=[profile?] <dev-haskell/tagged-1:=[profile?]
	>=dev-haskell/text-0.11.1:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/th-lift-0.7.6:=[profile?] <dev-haskell/th-lift-1:=[profile?]
	>=dev-haskell/transformers-0.2.1:=[profile?] <dev-haskell/transformers-0.6:=[profile?]
	>=dev-haskell/transformers-compat-0.5:=[profile?] <dev-haskell/transformers-compat-1:=[profile?]
	>=dev-haskell/void-0.5:=[profile?] <dev-haskell/void-1:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/base-compat-0.8.2 <dev-haskell/base-compat-1
		>=dev-haskell/base-orphans-0.4.2 <dev-haskell/base-orphans-1
		>=dev-haskell/hspec-2 <dev-haskell/hspec-3
		>=dev-haskell/quickcheck-2.5 <dev-haskell/quickcheck-3
		>=dev-haskell/quickcheck-instances-0.1 <dev-haskell/quickcheck-instances-0.4
		>=dev-haskell/tagged-0.8.3 <dev-haskell/tagged-1 )
"

src_prepare() {
	epatch "${FILESDIR}"/${P}-haddock.patch
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-developer
}
