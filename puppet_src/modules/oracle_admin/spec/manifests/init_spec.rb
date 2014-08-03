require_relative '../../../../spec_helper.rb'

describe 'oracle_admin', type: :class do
  it do
    should contain_file('/opt/capdoracle').
      with(
        'ensure' => 'directory',
        'owner'  => 'root',
        'group'  => 'deploy',
        'mode'   => '0750',
    )
    should contain_file('/opt/capdoracle/drop_database.sh').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0755',
        'require' => 'File[/opt/capdoracle]',
    ).with_content(/CAPD_AUTH@capd/)
    should contain_file('/opt/capdoracle/create_users.sh').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0755',
        'require' => 'File[/opt/capdoracle]',
    ).with_content(/CAPD_AUTH@capd/)
    should contain_file('/opt/capdoracle/create_audit.sh').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0755',
        'require' => 'File[/opt/capdoracle]',
    ).with_content(/CAPD_AUTH@capd/)
    should contain_file('/opt/capdoracle/sitiagri').
      with(
        'ensure'  => 'directory',
        'owner'   => 'root',
        'group'   => 'deploy',
        'mode'    => '0750',
        'require' => 'File[/opt/capdoracle]',
    )
    should contain_file('/opt/capdoracle/sitiagri/add_users.sh').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'deploy',
        'mode'    => '0750',
        'require' => 'File[/opt/capdoracle/sitiagri]',
    ).with_content(/CAPD_AUTH@capd/)
    should contain_file('/opt/capdoracle/sitiagri/add_users.sql').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'deploy',
        'mode'    => '0640',
        'require' => 'File[/opt/capdoracle/sitiagri]',
    )
    should contain_file('/opt/capdoracle/sitiagri/01_tablespaces.sql').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'deploy',
        'mode'    => '0640',
        'require' => 'File[/opt/capdoracle/sitiagri]',
    ).with_content(/siti.dbf/)
    should contain_file('/opt/capdoracle/sitiagri/02_users.sql').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'deploy',
        'mode'    => '0640',
        'require' => 'File[/opt/capdoracle/sitiagri]',
    ).with_content(/siti_pwd/)
    should contain_file('/opt/capdoracle/reset_flags.sh').
      with(
        'ensure'  => 'present',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0755',
        'require' => 'File[/opt/capdoracle]',
    ).with_content(/CAPD_AUTH@capd/)
  end
end

