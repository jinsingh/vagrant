require_relative '../../../../spec_helper.rb'

describe 'capdmatching::package', :type => :class do
  it do
    should contain_package('capdmatching').with(
      'ensure'   => 'latest',
      )
  end
end