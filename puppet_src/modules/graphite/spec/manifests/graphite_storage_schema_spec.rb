require_relative '../../../../spec_helper.rb'

describe 'graphite', :type => :class do
  it do
    should contain_file('/opt/graphite/conf/storage-schemas.conf').
    with_content(/retentions = */)
  end
end