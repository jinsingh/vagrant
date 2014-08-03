require_relative '../../../../spec_helper.rb'

describe 'fail2ban::config', type: :class do

  context 'a normal environment' do
    let(:facts) { { fqdn: 'foobar.rpa.capaccept' } }
    it do
      should contain_file('/etc/fail2ban/fail2ban.conf')
      should contain_file('/etc/fail2ban/jail.conf').without_content(/httpd/)
      should contain_file('/etc/fail2ban/action.d/mail-whois-lines.conf')
      should contain_file('/etc/fail2ban/action.d/sendmail-whois-lines.conf')
      should contain_cron('fail2ban').with(
        'ensure'  => 'present',
        'user'    => 'root',
        'minute'  => '0',
        'hour'    => '11',
        'command' => "/sbin/service fail2ban status ; [ ! $? -eq \"0\" ] && echo Service fail2ban is not running on foobar.rpa.capaccept | mail -s \"CAPD Fail2ban Service check\" blah@example.com",
        'require' => 'Package[fail2ban]',
        )
      should contain_file('/etc/rsyslog.d/21-fail2ban.conf').with_ensure('present')
      should contain_logrotate__file('fail2ban').with(
        'log'        => '/var/log/fail2ban.log',
        'options'    =>
                [ 'notifempty',
                  'daily',
                  'rotate 14',
                ],
        'postrotate' => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
      )
    end
  end

  context 'an environment with apache' do
    let(:facts) { { fqdn: 'capmonitoring.rpa.capaccept' } }
    it do
      should contain_file('/etc/fail2ban/jail.conf').with_content(/httpd/)
    end
  end
end
