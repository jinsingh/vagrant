require_relative '../../../../spec_helper.rb'

describe 'defra_collectd', type: :class do
  it do
    should contain_class('collectd').with_version('5.1.0-1.el6.rft').
      with_require('Class[Repo]')
    should contain_class('collectd::plugin::write_graphite').
      with_graphitehost('capgraphing.rpa.spec').with_storerates('true')
    should contain_class('collectd::plugin::disk').with_disks('xvda1')
  end
end