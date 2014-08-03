require_relative '../../../../spec_helper.rb'

describe 'capdmockidahub::package', type: :class do
  it do
    should contain_package('capdmocksplayidahub').with_ensure('latest')
  end
end