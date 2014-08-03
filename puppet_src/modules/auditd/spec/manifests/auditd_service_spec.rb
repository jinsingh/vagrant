require_relative '../../../../spec_helper.rb'

describe 'auditd::service', type: :class do
  it do
    should contain_service('auditd')
  end
end
