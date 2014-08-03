require_relative '../../../../spec_helper.rb'

describe 'capdssui::config', type: :class do
  it do
    should contain_file('/etc/init/capdssui.conf').with_ensure('present').
      with('source' => 'puppet:///modules/capdssui/capdssui-job.conf')
    #should contain_file('/opt/capd-ssui/etc/mapping.conf').with_ensure('present').
      #with_content(/https:\/\/capd-spec.kainos.com\/geoserver\/gwc\/service\/wmts/)
    should contain_file('/opt/capd-ssui/etc/capdssui.conf').with_ensure('present').
      with_content(/service.api.url="http:\/\/192.168.99.111:4685/)
  end
end