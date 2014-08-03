require_relative '../../../../spec_helper.rb'

describe 'postfix::service', :type => :class do

  it do
    should contain_service('postfix').with(
      'ensure'     => 'running',
      'enable'     => 'true',
      )
  end
end