require_relative '../../../spec_helper.rb'

describe 'graphviz', :type => :class do
  it do
    should contain_package('graphviz').with_ensure('present')
  end
end