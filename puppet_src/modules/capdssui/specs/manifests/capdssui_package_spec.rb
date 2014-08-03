require_relative '../../../../spec_helper.rb'

describe 'capdssui::package', type: :class do
  it do
    should contain_package('capdssui').with_ensure('installed')
  end
end