require_relative '../../../../spec_helper.rb'

describe 'capdinternaluserauth::package', :type => :class do
  it do
    should contain_package('capdinternaluserauthservices')
  end
end
