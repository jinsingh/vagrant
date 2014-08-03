require_relative '../../../../spec_helper.rb'

describe 'capdinternaluseractivation::package', type: :class do
  it do
    should contain_package('capdinternaluseractivation').
      with_ensure('latest')
  end
end
