require_relative '../../../../spec_helper.rb'

describe 'nodes::s_capapp', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('java')
    should contain_class('tomcat')
    should contain_class('capapp')
  end
end
