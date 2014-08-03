require_relative '../../../../spec_helper.rb'

describe 'hardening::userpolicy', :type => :class do
  it do
    should contain_file('/etc/login.defs').with_ensure('file')
    should contain_file('/etc/pam.d/system-auth').with_ensure('file')
    should contain_file('/var/log/tallylog').with_ensure('file')
    should contain_exec('harden dot files').with({
        'provider' => 'shell',
        'command' => 'find /home/*/ -maxdepth 1 -name \'.*\' -exec chmod 700 {} \;',
        'unless' => 'foo=$(find /home/*/ -maxdepth 1 -name \'.*\' ! -perm 700); if [[ -n $foo ]] ; then exit 1; fi',
      })
  end
end