require 'spec_helper'

describe 'java8', :type => :class do

  shared_examples_for 'a linux os' do
    it " should compile.with_all_deps "
    it { should contain_class('apt') }
    it { should contain_package('oracle-java8-installer').with(
      'responsefile' => '/tmp/java.preseed'
    ) }
    it { should contain_file('/tmp/java.preseed').with(
      'source' => 'puppet:///modules/java8/java.preseed',
      'mode' => '0600',
      'backup' => 'false'
    ) }
    it { should contain_file('/etc/profile.d/set_java_home.sh')}
  end

  context 'supported operating systems' do
    describe 'ubuntu' do
      ['precise', 'trusty'].each do |lsbdistcodename|
        context "#{lsbdistcodename}" do
          let(:facts) {{
            :osfamily => 'Debian',
            :operatingsystem => 'Ubuntu',
            :lsbdistcodename =>  lsbdistcodename
          }}
          it_behaves_like 'a linux os' do
          end
          it { should contain_apt__ppa('ppa:webupd8team/java') }
        end
      end
    end
    describe 'debian' do
      ['squeeze', 'wheezy'].each do |lsbdistcodename|
        context "#{lsbdistcodename}" do
          let(:facts) {{ 
            :operatingsystem => 'Debian',
            :osfamily => 'Debian',
            :lsbdistcodename => lsbdistcodename,
          }}
          it_behaves_like 'a linux os' do
          end
          it { should contain_apt__source('webupd8team-java').with(
            'location' => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
            'release' => 'precise',
            'repos' => 'main',
            'key' => '7B2C3B0889BF5709A105D03AC2518248EEA14886',
            'key_server' => 'keyserver.ubuntu.com',
            'include_src' => 'true',
          ) }
        end
      end
    end
  end
end
