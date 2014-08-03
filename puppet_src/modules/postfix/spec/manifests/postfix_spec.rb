require_relative '../../../../spec_helper.rb'

describe 'postfix', :type => :class do
  it do
    should contain_class('postfix::config')
    should contain_class('postfix::package')
    should contain_class('postfix::service')
  end
end