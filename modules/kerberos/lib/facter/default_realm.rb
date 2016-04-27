# default_realm.rb
require 'augeas'
Facter.add('default_realm') do
  Augeas::open do |aug|
    aug.get('/files/etc/krb5.conf/libdefaults/default_realm')
  end
end
