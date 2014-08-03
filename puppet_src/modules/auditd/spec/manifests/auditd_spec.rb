require_relative '../../../../spec_helper.rb'

describe 'auditd', type: :class do
  it do
    should contain_class('auditd::config')
    should contain_class('auditd::package')
    should contain_class('auditd::service')
  end
end
