require 'spec_helper'

describe('apache', :type => :class) do
  let(:facts) { { :osfamily => 'RedHat' } }

  it { should compile.with_all_deps }
  it { should contain_package('apache').with({
    'ensure' => 'present',
    }) }
  it { should contain_file('apache_config') \
    .with_path('/etc/httpd/conf/httpd.conf') \
    .with_source("puppet:///modules/apache/#{facts[:osfamily].downcase}.conf") }
  it { should contain_service('apache') }
end
