
require_relative '../../../../spec_helper.rb'

describe 'sshd::package', type: :class do
  it do
    should contain_package('openssh-server').with_ensure('present')
  end
end