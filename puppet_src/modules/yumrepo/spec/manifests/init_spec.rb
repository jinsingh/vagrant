require_relative '../../../../spec_helper.rb'

describe 'yumrepo', type: :class do
  it do
    should contain_class('yumrepo::package')
    should contain_class('yumrepo::config')
    should contain_class('yumrepo::service')
  end 
end

