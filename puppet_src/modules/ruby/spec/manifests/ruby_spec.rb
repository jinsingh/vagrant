require_relative '../../../../spec_helper.rb'

describe 'ruby', :type => :class do
  it do
    should contain_class('rbenv')
    should contain_rbenv__plugin('sstephenson/ruby-build')
    should contain_rbenv__build('2.0.0-p353')
    should contain_rbenv__gem('hiera-eyaml')
  end
end