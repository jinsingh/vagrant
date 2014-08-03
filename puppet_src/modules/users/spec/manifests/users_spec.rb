require_relative '../../../../spec_helper.rb'

describe 'users', :type => :class do
  it do
    should contain_group('admin')
    should contain_exec('echo "Defaults:deploy !requiretty" >> /etc/sudoers').
      with_unless('grep "Defaults:deploy !requiretty" /etc/sudoers').
      with_before('Exec[echo "#includedir /etc/sudoers.d" >> /etc/sudoers]')
  end
end