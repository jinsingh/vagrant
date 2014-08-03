require_relative '../../../../spec_helper.rb'

describe 'opsview_server::servicechecks', :type => :class do
  it do
    should compile.with_all_deps
  end
end
