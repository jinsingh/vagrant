require_relative '../../../../spec_helper.rb'

describe 'sqlplus_client', type: :class do
  it do
    should contain_class('sqlplus_client::package')
    should contain_class('sqlplus_client::config')
  end
end
