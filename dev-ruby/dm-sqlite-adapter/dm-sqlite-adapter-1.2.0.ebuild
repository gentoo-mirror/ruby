# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_TASK_DOC="yard"

RUBY_FAKEGEM_DOCDIR="doc"

inherit ruby-fakegem

DESCRIPTION="Sqlite3 Adapter for DataMapper"
HOMEPAGE="http://datamapper.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/jeweler >=dev-ruby/yard-0.8.7 )"
ruby_add_bdepend "test? (
	dev-ruby/jeweler
	dev-ruby/rspec:0
	=dev-ruby/dm-migrations-1.2.0 )"

ruby_add_rdepend "
	dev-ruby/dm-do-adapter
	dev-ruby/do_sqlite3"

all_ruby_prepare() {
	sed -i -e "s/gem 'jeweler'/#gem 'jeweler'/g" Rakefile || die
}