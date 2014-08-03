require_relative '../../../../spec_helper.rb'

describe 'rkhunter::package', type: :class do
  it do
    should contain_package('rkhunter').with_ensure('latest')
  end
end