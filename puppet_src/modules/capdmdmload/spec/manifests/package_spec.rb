require_relative '../../../../spec_helper.rb'

describe 'capdmdmload::package', type: :class do
  it do
    should contain_package('capdmdmload').with_ensure('latest')
  end
end
