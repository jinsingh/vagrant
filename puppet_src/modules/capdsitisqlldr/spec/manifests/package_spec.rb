require_relative '../../../../spec_helper.rb'

describe 'capdsitisqlldr::package', type: :class do
  it do
    should contain_package('capdsitisqlldr').with_ensure('latest')
  end
end
