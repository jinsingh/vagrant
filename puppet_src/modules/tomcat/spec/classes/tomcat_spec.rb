require_relative '../../../../spec_helper.rb'

describe 'tomcat', :type => :class do
  
  it do
    should contain_package('tomcat6').with(
  		'ensure'  => 'installed',
  	)
  	should contain_package('tomcat6-webapps').with('ensure'  => 'installed',)
  	should contain_package('tomcat6-admin-webapps').with('ensure'  => 'installed',)
  	should contain_service('tomcat6')
  end
end