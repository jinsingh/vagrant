require_relative '../../../../spec_helper.rb'

describe 'nodes::s_capdbmapwms', :type => :class do
  it do
    contain_class('java')
    contain_class('postfix')
    contain_class('opsview_agent')
    contain_class('sqlplus_client')
    contain_class('siti_data')
    contain_class('siti_dataloader')
  end
end
