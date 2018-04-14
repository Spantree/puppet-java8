source "https://rubygems.org"

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['~> 4.0.0']

group :test do
  gem "rake"
  gem 'puppet', puppetversion
  gem 'puppetlabs_spec_helper', '>= 0.1.0'
  gem 'rspec-puppet', '~> 2.3.0'
  gem 'puppet-lint', '>= 1.0.0'
  gem 'facter', '>= 1.7.0'
  gem 'nokogiri', '~> 1.8'
  #gem 'CFPropertyList', '~> 2.2'
end

group :development do
  gem "travis"
  gem "travis-lint"
  gem "beaker"
  gem "beaker-rspec"
  gem "vagrant-wrapper"
  gem "puppet-blacksmith"
end
