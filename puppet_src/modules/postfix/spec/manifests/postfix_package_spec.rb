require_relative '../../../../spec_helper.rb'

describe 'postfix::package', type: :class do
  it do
    should contain_package('postfix').with_ensure('installed')
  end
end