require_relative '../../../../spec_helper.rb'

describe 'elasticsearch-curator', :type => :class do
  it do
    should compile.with_all_deps
    should contain_package('python-pip')
    should contain_package('urllib3').with(
      'ensure'   => 'installed',
      'provider' => 'pip',
      'require'  => 'Package[python-pip]',)
    should contain_file('/opt/elasticsearch-curator').with(
      'ensure' => 'directory',
      'owner'  => 'root',
      'group'  => 'root',
      'purge'  => true,)
    should contain_file('es').with(
      'path'    => '/usr/lib/python2.6/site-packages/elasticsearch/',
      'ensure'  => 'directory',
      'recurse' => 'true',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0755',
      'source'  => 'puppet:///modules/elasticsearch-curator/elasticsearch',
      'require' => 'Package[python-pip]',)
    should contain_file('es-dist-info').with(
      'path'    => '/usr/lib/python2.6/site-packages/elasticsearch-1.0.0.dist-info',
      'ensure'  => 'directory',
      'recurse' => 'true',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0755',
      'source'  => 'puppet:///modules/elasticsearch-curator/elasticsearch-1.0.0.dist-info',
      'require' => 'Package[python-pip]',)
    should contain_file('/opt/elasticsearch-curator/curator.py').with(
      'ensure'  => 'present',
      'source'  => 'puppet:///modules/elasticsearch-curator/curator.py',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0755',
      'require' => [
                      'File[/opt/elasticsearch-curator]',
                      'File[es]',
                      'File[es-dist-info]',
                      'Package[python-pip]',
                    ])
    should contain_cron('elasticsearch-curator').with(
      'command' => "/usr/bin/python /opt/elasticsearch-curator/curator.py --host 10.179.134.211 -d 2 -D",
      'user'    => 'root',
      'hour'    => '7',
      'minute'  => '30',
      'require' => 'File[/opt/elasticsearch-curator/curator.py]',
      )
  end
end
