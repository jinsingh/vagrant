require_relative '../../../../spec_helper.rb'

describe 'deploy', type: :class do
  it do
    should contain_file('11_deploy').with_content(/\/usr\/bin\/puppet apply --color\\=false --modulepath\\=\/etc\/puppet\/modules --show_diff \/etc\/puppet\/manifests\/site.pp/).
    with_content(/\/usr\/bin\/yum update capd\-hieradata\-\* \-\y/)
  end
end
