require_relative '../../../../spec_helper.rb'

describe 'haproxy', :type => :class do
  it do
    should contain_file('/etc/haproxy/haproxy.cfg').
      with_content(/bind 0.0.0.0:8900/).
      with_content(/use_backend abacodbmap if is_wms/).
      with_content(/use_backend realsiti if is_real_sitiagri/).
      with_content(/use_backend matching if is_ida_matching/).
      with_content(/use_backend matching_adapter if is_msa/).
      with_content(/use_backend internal_auth if is_internal_auth/).
      with_content(/use_backend services if is_to_validate/).
      with_content(/use_backend mock_idahub if is_ida/).
      with_content(/use_backend services if is_api_user or is_api/).
      with_content(/server realsiti1 10.1.1.1:8080/).
      with_content(/server user_auth1 10.179.133.214:9005/).
      with_content(/server matching_adapter1 10.179.133.214:8750/).
      with_content(/server matching1 10.179.133.214:8050/).
      with_content(/server mock_idahub1 10.179.135.163:9002/).
      with_content(/server abacodbmap1linux 10.179.134.199:8080/).
      with_content(/server internal_auth1 10.179.133.214:5000/).
      with_content(/server services1 10.179.133.214:4685/).
      with_content(/server sendmail1 10.179.133.214:9003/).
      with_content(/server sendmail_admin1 10.179.133.214:9004/).
      with_content(/server hippo_cms1 134.213.67.62:8080/)
    should contain_service('haproxy').with(
      'ensure'     => 'running',
      'enable'     => 'true',
      'subscribe'  => "File[/etc/haproxy/haproxy.cfg]",
      )
    should contain_logrotate__file('haproxy').with(
      'log'        => '/var/log/capd/haproxy.log',
      'options'    =>
      ['missingok',
       'compress',
       'daily',
       'rotate 14',
       ],
       'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
       )
     should contain_package('haproxy').with_ensure('1.5-dev22.1')
  end
end
