require_relative '../../../../spec_helper.rb'

describe 'nodes::s_capwebauth', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('capdplayauth')
  end
end
