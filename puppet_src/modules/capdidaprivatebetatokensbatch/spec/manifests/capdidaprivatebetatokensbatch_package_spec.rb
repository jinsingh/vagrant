require_relative '../../../../spec_helper.rb'

describe 'capdidaprivatebetatokensbatch::package', :type => :class do
  it do
    should contain_package('capdidaprivatebetatokensbatch').with(
      'ensure'   => 'latest',
      )
  end
end