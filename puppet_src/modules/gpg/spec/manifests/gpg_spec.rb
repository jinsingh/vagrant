require_relative '../../../../spec_helper.rb'

describe 'gpg::vagrant', :type => :class do
  it do
    should contain_file('/root/.gnupg/gpg.conf').with_ensure('present')
    should contain_file('/root/.gnupg/private.key').with_ensure('present')
    should contain_file('/root/.gnupg/pubring.gpg').with_ensure('present')
    should contain_file('/root/.gnupg/random_seed').with_ensure('present')
    should contain_file('/root/.gnupg/secring.gpg').with_ensure('present')
  end
end