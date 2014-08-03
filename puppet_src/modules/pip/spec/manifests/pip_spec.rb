require_relative '../../../../spec_helper.rb'

describe 'pip', :type => :class do
  it do
    should contain_class('pip')
    should contain_package('python-pip').with_ensure('installed')
  end
end