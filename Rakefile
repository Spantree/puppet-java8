require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'rake/clean'


# These two gems aren't always present, for instance
# on Travis with --without development
begin
  require 'puppet_blacksmith/rake_tasks'
rescue LoadError
end

clean_paths = ["spec/fixtures/*", "pkg"]
CLEAN.include(clean_paths)
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]
PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
PuppetLint.configuration.relative = true

# Forsake support for Puppet 2.6.2 for the benefit of cleaner code.
# http://puppet-lint.com/checks/class_parameter_defaults/
PuppetLint.configuration.send('disable_class_parameter_defaults')
# http://puppet-lint.com/checks/class_inherits_from_params_class/
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.fail_on_warnings = true

desc "Run acceptance tests"
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end

desc "Run syntax, lint, and spec tests."
task :test => [
  :validate,
  :lint,
  :spec,
]

desc "Validate manifests, templates, and ruby files"
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end
