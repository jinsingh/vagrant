require_relative '../../../../spec_helper.rb'

describe 'capapp::config', type: :class do
  it do
    should contain_file('/etc/tomcat6/tomcat-users.xml').
      with_content(/cap-del1very/)
    should contain_file('/etc/tomcat6/server.xml')
  end
end
