require_relative '../../../../spec_helper.rb'

describe 'siti_data', :type => :class do
  it do
    should contain_package('siti-data').with('ensure'=>'latest',)
  end
end
