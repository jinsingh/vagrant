require_relative '../../../../spec_helper.rb'

describe 'wget', :type => :class do
  it do
    should contain_package('wget').with_ensure('installed')
  end
end