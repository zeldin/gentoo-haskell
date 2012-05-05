# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit base haskell-cabal

DESCRIPTION="Efficient routing for Yesod."
HOMEPAGE="http://www.yesodweb.com/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=dev-haskell/path-pieces-0.1*[profile?]
		>=dev-haskell/text-0.5[profile?]
		<dev-haskell/text-0.12[profile?]
		>=dev-haskell/vector-0.8[profile?]
		<dev-haskell/vector-0.10[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >=dev-haskell/cabal-1.10
			dev-haskell/hunit[profile?]
			>=dev-haskell/hspec-0.6[profile?]
			<dev-haskell/hspec-1.1[profile?]
		)
		"

PATCHES=("${FILESDIR}/${PN}-1.0.1-hspec-1.0.patch")

src_prepare() {
	base_src_prepare
	# upstream forgot to include the tests
	cp -pR "${FILESDIR}/${PN}-1.0.0/test" "${S}/test" \
		|| die "Could not copy missing tests"
}
