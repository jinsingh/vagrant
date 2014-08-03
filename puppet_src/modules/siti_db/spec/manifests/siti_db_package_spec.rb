require_relative '../../../../spec_helper.rb'

describe 'siti_db::package', :type => :class do
  it do
    should contain_package('git').with(
      'ensure'   => 'latest',
      )
  end
end
