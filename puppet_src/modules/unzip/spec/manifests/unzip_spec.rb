require_relative '../../../../spec_helper.rb'

describe 'unzip', :type => :class do
  it do
    should contain_package('unzip').
      with_ensure('installed')
  end
end