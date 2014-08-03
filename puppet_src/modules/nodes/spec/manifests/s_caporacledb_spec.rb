require_relative '../../../../spec_helper.rb'

describe 'nodes::s_caporacledb', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('postfix')
    should contain_class('oracledb')
    should contain_class('swap_file')
    should contain_class('java')
    should contain_class('opsview_agent')
    should contain_class('sqlplus_client')
  end
end
