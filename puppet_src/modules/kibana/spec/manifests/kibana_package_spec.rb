require_relative '../../../../spec_helper.rb'

describe 'kibana::package', :type => :class do
  it do
    should contain_file('/opt/kibana/config.js').with_content(/window\.location\.hostname/)
    should contain_file('/opt/kibana')
  end
end

