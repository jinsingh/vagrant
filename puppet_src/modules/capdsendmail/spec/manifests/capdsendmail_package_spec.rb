require_relative '../../../../spec_helper.rb'

describe 'capdsendmail::package', type: :class do
  it do
    should contain_package('capdsendmail').with_ensure('latest')
  end
end