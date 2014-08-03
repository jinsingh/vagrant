require_relative '../../../../spec_helper.rb'

describe 'capdinternalload::package', :type => :class do
  it do
    should contain_package('capdinternalload').with(
      'ensure'   => 'latest',
      )
  end
end