require_relative '../../../../spec_helper.rb'

describe 'mod_security::package', type: :class do
  it do
    should contain_package('mod_security').with_ensure('latest')
  end
end