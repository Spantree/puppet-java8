source "https://rubygems.org"

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']

group :test do
  gem "rake"
  gem 'puppet', puppetversion
  gem 'puppetlabs_spec_helper', '>= 0.1.0'
  gem 'rspec-puppet', :git => 'https://github.com/spantree/rspec-puppet.git'
  gem 'puppet-lint', '>= 1.0.0'
  gem 'facter', '>= 1.7.0'
end

group :development do
  gem "travis"
  gem "travis-lint"
  gem "beaker"
  gem "beaker-rspec"
  gem "vagrant-wrapper"
  gem "puppet-blacksmith"
  gem "guard-rake"
end
