require_relative '../../../../spec_helper.rb'

describe 'siti_db', :type => :class do
  it do
    should contain_class('siti_db::config')
    should contain_class('siti_db::deploy')
    should contain_class('siti_db::package')
  end
end
