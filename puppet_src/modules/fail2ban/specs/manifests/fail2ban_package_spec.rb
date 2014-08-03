require_relative '../../../../spec_helper.rb'

describe 'fail2ban::package', type: :class do
  it do
    should contain_package('fail2ban').with_ensure('present')
  end
end