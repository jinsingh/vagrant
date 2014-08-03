require_relative '../../../../spec_helper.rb'

describe 'oracledb', :type => :class do
  it do
    should contain_class('oracledb::package')
    should contain_class('oracledb::autostart')
    should contain_class('oracledb::listener')
    should contain_class('oracledb::database')
    should contain_class('oracledb::config')
  end
end