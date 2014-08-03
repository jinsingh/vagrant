require_relative '../../../../spec_helper.rb'

describe 'createrepo_c', type: :class do
  it do
    should contain_package('createrepo_c').with_ensure('present')
  end
end
