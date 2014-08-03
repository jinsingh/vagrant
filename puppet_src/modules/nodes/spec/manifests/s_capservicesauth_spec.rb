require_relative '../../../../spec_helper.rb'

describe 'nodes::s_capservicesauth', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('capdauth')
    should contain_class('java')
  end
end
