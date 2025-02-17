# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.1.1.9999
#hackport: flags: -dev

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

TESTS_PN="${CABAL_PN}-tests"
TESTS_P="${TESTS_PN}-${CABAL_PV}"

DESCRIPTION="Lightweight package providing commonly useful parser combinators"
HOMEPAGE="https://github.com/mrkkrp/parser-combinators"
SRC_URI+=" https://hackage.haskell.org/package/${TESTS_P}/${TESTS_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=dev-lang/ghc-8.6.3:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.4.0.1
	test? ( >=dev-haskell/hspec-2.0 <dev-haskell/hspec-3.0
		>=dev-haskell/hspec-expectations-0.8 <dev-haskell/hspec-expectations-0.9
		>=dev-haskell/hspec-megaparsec-2.0 <dev-haskell/hspec-megaparsec-3.0
		>=dev-haskell/megaparsec-8.0 <dev-haskell/megaparsec-10.0
		>=dev-haskell/megaparsec-tests-8.0 <dev-haskell/megaparsec-tests-10.0
		>=dev-haskell/quickcheck-2.7 <dev-haskell/quickcheck-2.15 )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-dev
}

src_test() {
	if use test; then
		local -a configure_flags=( "--flag=-dev" )

		# Runs the block if the main package is not installed currently
		if ! ghc-pkg describe "${CABAL_PN}" &>/dev/null; then
			./setup register --inplace --gen-pkg-config || die
			ghc-pkg init pkgdb || die
			ghc-pkg -f pkgdb register "${CABAL_P}.conf" || die
			configure_flags+=( "--package-db=${S}/pkgdb" )
		fi

		local old_S="${S}"
		export S="${WORKDIR}/${TESTS_P}"
		pushd "${S}" > /dev/null || die

		haskell-cabal_src_configure "${configure_flags[@]}"
		haskell-cabal_src_compile
		haskell-cabal_src_test

		popd > /dev/null || die
		export S="${old_S}"
	fi
}
