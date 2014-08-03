require_relative '../../../../spec_helper.rb'

describe 'capdservices::package', type: :class do
  it do
    should contain_package('capdservices').with_ensure('installed')
  end
end