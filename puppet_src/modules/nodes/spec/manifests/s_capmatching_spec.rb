require_relative '../../../../spec_helper.rb'

describe 'nodes::s_capmatching', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('capdmatchingadapter')
    should contain_class('java')
  end
end
