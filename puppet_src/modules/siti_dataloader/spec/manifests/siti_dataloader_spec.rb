require_relative '../../../../spec_helper.rb'

describe 'siti_dataloader', :type => :class do
  it do
    should contain_package('capd-siti-linux-dataloader').
      with( 'ensure' => 'latest',)
    should contain_file('/opt/capd-siti-linux-dataloader/load-grid-all.sh').with(
      'owner'   => 'root',
      'group'   => 'deploy',
      'mode'    => '0750',
      'require' => 'Package[capd-siti-linux-dataloader]',)
      .with_content(/siti_pwd/)
    should contain_file('/opt/capd-siti-linux-dataloader/load-rlr-cll.cfg').with(
      'owner'   => 'root',
      'group'   => 'deploy',
      'mode'    => '0640',
      'source'  => 'puppet:///modules/siti_dataloader/load-rlr-cll.cfg',
      'require' => 'Package[capd-siti-linux-dataloader]',)
    should contain_file('/opt/capd-siti-linux-dataloader/load-England_messages.sh')
        .with_content(/csv2ora -d \"\/\/10.179.195.120:1521\/capd\" -u siti -p siti_pwd -t load_eng_messages -l load_eng_messages.log -f \/opt\/capd-siti-linux-dataloader\/CapdNotifications.psv -c load-England_messages.cfg/)
    should contain_file('/opt/capd-siti-linux-dataloader/load-England_messages.cfg')
        .with_content(/truncate table load_eng_messages/)
  end
end

