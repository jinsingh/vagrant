require_relative '../../../../spec_helper.rb'

describe 'capdexpirepasswords', :type => :class do
  it do
    should contain_class('capdexpirepasswords::config')
    should contain_class('capdexpirepasswords::package')
  end
end
