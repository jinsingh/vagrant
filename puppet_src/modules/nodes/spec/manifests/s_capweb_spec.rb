require_relative '../../../../spec_helper.rb'

describe 'nodes::s_capweb', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('java')
    should contain_class('postfix')
    should contain_class('capdssui')
    should contain_class('nginx')
    should contain_class('libluajit')
    should contain_class('opsview_agent')
    should contain_class('capdmockidahub')
  end
end
