require_relative '../../../../spec_helper.rb'

describe 'nodes::s_graphing', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('opsview_agent')
    should contain_class('collectd')
    should contain_class('graphite')
  end
end