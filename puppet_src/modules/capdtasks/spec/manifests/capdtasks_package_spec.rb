require_relative '../../../../spec_helper.rb'

describe 'capdtasks::package', type: :class do
  it do
    should contain_package('capdtasks').with_ensure('installed')
  end
end