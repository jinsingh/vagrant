require_relative '../../../../spec_helper.rb'

describe 'java', :type => :class do
  it do
    should contain_package('java-1.7.0-openjdk').with_ensure('installed')
  end
end