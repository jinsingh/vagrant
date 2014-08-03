require_relative '../../../../spec_helper.rb'

describe 'nc', :type => :class do
  it do
    should contain_package('nmap-ncat').
      with_ensure('installed')
  end
end