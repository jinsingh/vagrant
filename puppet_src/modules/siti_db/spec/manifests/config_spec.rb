require_relative '../../../../spec_helper.rb'

describe 'siti_db', :type => :class do
  it do
    should contain_file('/root/.ssh')
    should contain_file('/root/.ssh/id_rsa.pub')
  end
end

