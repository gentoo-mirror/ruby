# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/bundler/bundler-1.1.5.ebuild,v 1.2 2012/08/14 03:10:38 flameeyes Exp $

EAPI=4

#Rspec hasn't support to rbx!
USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_TASK_TEST="spec"

# No documentation task
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README VERSION"

inherit ruby-fakegem

DESCRIPTION="BlankSlate extracted from Builder"
HOMEPAGE="http://github.com/masover/blankslate"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_rdepend virtual/rubygems

ruby_add_bdepend "test? ( dev-ruby/rspec )"

all_ruby_prepare() {
	#Bundler isn't really necessary here, and it doesn't work with jruby
	sed -i -e "2s/require 'bundler'//" Rakefile || die
	sed -i -e "3s/Bundler::GemHelper.install_tasks//" Rakefile || die
}