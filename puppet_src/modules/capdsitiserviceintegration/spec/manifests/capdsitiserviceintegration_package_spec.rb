require_relative '../../../../spec_helper.rb'

describe 'capdsitiserviceintegration::package', type: :class do
  it do
    should contain_package('capdsitiserviceintegration').with_ensure('latest')
  end
end