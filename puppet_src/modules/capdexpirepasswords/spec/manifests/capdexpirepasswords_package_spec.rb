require_relative '../../../../spec_helper.rb'

describe 'capdexpirepasswords::package', :type => :class do
  it do
    should contain_package('capdexpirepasswords').
      with(
        'ensure'  => 'latest',
    )
  end
end
