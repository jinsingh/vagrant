require_relative '../../../../spec_helper.rb'

describe 'capdinternaluserauth', :type => :class do
  it do
    should contain_class('capdinternaluserauth::config')
    should contain_class('capdinternaluserauth::package')
  end
end
