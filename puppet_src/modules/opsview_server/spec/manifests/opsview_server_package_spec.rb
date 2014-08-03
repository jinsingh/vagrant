require_relative '../../../../spec_helper.rb'

describe 'opsview_server::package', :type => :class do
  it do
    should contain_package('opsview').with(
      'ensure'     => 'latest')
    should contain_package('ruby-devel').with(
      'ensure'     => 'latest')
    should contain_package('gcc').with(
      'ensure'     => 'latest')
  end
end
