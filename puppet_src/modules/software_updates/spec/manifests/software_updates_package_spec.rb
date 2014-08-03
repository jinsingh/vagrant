
require_relative '../../../../spec_helper.rb'

describe 'software_updates::package', type: :class do
  it do
    should contain_package('yum-cron').with_ensure('present')
  end
end