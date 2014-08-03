require_relative '../../../../spec_helper.rb'

describe 'capdplayauth::package', type: :class do
  it do
    should contain_package('capdplayauth').with_ensure('latest')
  end
end