require_relative '../../../../spec_helper.rb'

describe 'hardening::disable', :type => :class do
  it do
    should contain_exec('disable lp user')
    should contain_exec('disable uucp user')
    should contain_exec('disable gnats user')
    should contain_exec('disable games user')
    should contain_exec('disable mail user')
    should contain_exec('disable apache user')
    should contain_exec('disable daemon user')
  end
end