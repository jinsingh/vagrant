require_relative '../../../../spec_helper.rb'

describe 'capdmatchingadapter::package', :type => :class do
  it do
    should contain_package('capdmatchingadapter').with(
      'ensure'   => 'latest',
      )
  end
end