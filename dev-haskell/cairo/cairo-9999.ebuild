# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour nocabaldep"
inherit git-2 haskell-cabal

DESCRIPTION="Binding to the Cairo library"
HOMEPAGE="http://projects.haskell.org/gtk2hs/"
EGIT_REPO_URI="https://github.com/gtk2hs/gtk2hs.git"

EGIT_SOURCEDIR="${WORKDIR}/${P}"
S="${WORKDIR}/${P}/${PN}"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS=""
IUSE="+pdf +postscript +svg"

RDEPEND="dev-haskell/mtl:=[profile?]
	>=dev-haskell/text-0.11.0.6:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/utf8-string-0.2:=[profile?] <dev-haskell/utf8-string-0.4:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	x11-libs/cairo[svg?]
"
DEPEND="${RDEPEND}
	>=dev-haskell/gtk2hs-buildtools-0.13.0.2:0=
	virtual/pkgconfig
"

src_prepare() {
	sed -e "s@#include<cairo-features.h>@#define $(usex amd64 __x86_64__ __i386__)\n#include<cairo-features.h>@" \
		-i "${S}"/Graphics/Rendering/Cairo.hs \
		|| die "Could not define ABI in Graphics/Rendering/Cairo.hs"
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag pdf cairo_pdf) \
		$(cabal_flag postscript cairo_ps) \
		$(cabal_flag svg cairo_svg)
}
