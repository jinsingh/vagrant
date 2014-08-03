require_relative '../../../../spec_helper.rb'

describe 'capdauth::package', :type => :class do
  it do
    should contain_package('capdauth').with(
      'ensure'   => 'installed',
      )
  end
end