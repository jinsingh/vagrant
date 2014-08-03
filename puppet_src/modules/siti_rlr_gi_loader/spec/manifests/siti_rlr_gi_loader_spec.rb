require_relative '../../../../spec_helper.rb'

describe 'siti_rlr_gi_loader', :type => :class do
  it do
    should contain_file('/opt/capd-siti-rlr-gi-loader').with(
      'ensure' => 'directory',
    )
    should contain_package('capd-siti-rlr-gi-loader').with(
      'ensure' => 'latest',
    )
    should contain_file('/opt/capd-siti-rlr-gi-loader/loader.properties').
      with_content(/10.179.195.120/).
      with_content(/siti_pwd/)
    end
end


