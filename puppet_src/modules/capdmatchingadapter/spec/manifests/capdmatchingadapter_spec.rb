require_relative '../../../../spec_helper.rb'

describe 'capdmatchingadapter', type: :class do
  it do
    should contain_class('capdmatchingadapter::package')
    should contain_class('capdmatchingadapter::config')
    should contain_class('capdmatchingadapter::service')
  end
end
