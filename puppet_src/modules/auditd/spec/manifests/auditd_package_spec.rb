require_relative '../../../../spec_helper.rb'

describe 'auditd::package', type: :class do
  it do
    should contain_package('audit')
  end
end
