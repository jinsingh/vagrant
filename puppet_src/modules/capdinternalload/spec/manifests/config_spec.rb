require_relative '../../../../spec_helper.rb'

describe 'capdinternalload::config', type: :class do
  it do
    should contain_file('/etc/rsyslog.d/23-capdinternalload.conf')
    should contain_file('/opt/capdinternalload/')
  end
end
