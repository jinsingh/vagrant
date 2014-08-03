require_relative '../../../../spec_helper.rb'

describe 'memcached::package', type: :class do
  it do
    should contain_package('memcached').with_ensure('latest')
  end
end