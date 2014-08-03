require_relative '../../../../spec_helper.rb'

describe 'atomic_repo', type: :class do
  it do
    should contain_yumrepo('atomic').with_gpgkey('file:///etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt')
    should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt').with_ensure('present').
      with_source('puppet:///modules/atomic_repo/RPM-GPG-KEY.art.txt')
  end
end
