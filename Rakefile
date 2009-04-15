%w[rubygems rake rake/clean fileutils newgem rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/invoicing'

# Hoe calls Ruby with the "-w" set by default; unfortunately, ActiveRecord (at version 2.2.2
# at least) causes a lot of warnings internally, by no fault of our own, which clutters
# the output. Comment out the following four lines to see those warnings.
class Hoe
  RUBY_FLAGS = ENV['RUBY_FLAGS'] || "-I#{%w(lib test).join(File::PATH_SEPARATOR)}" +
      (RUBY_DEBUG ? " #{RUBY_DEBUG}" : '')
end

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.new('invoicing', Invoicing::VERSION) do |p|
  p.developer('Martin Kleppmann', 'rubyforge@eptcomputing.com')
  p.changes = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.post_install_message = 'PostInstall.txt'
  p.rubyforge_name = p.name
  p.extra_deps = [
    ['activerecord', '>= 2.1.0'],
    ['builder', '>= 2.0']
  ]
  p.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"]
  ]

  p.test_globs = %w[test/*_test.rb test/generators/*_test.rb] # do not include test/models/*.rb
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  p.rsync_args = '-av --delete --ignore-errors'
  #p.rcov_options = "-x '/Library/'"
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

# Tasks to run by default
# task :default => [:spec, :features]
