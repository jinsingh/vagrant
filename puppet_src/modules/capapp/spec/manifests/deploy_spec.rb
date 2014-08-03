require_relative '../../../../spec_helper.rb'

describe 'capapp::deploy', type: :class do
  it do
    should contain_file('/var/lib/tomcat6').with_ensure('link')
    should contain_file('/opt/tomcat6/webapps/').with_ensure('directory')
    should contain_file('/opt/tomcat6/webapps/estrazione/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/fascicolo/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/graduatoria/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/pams/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/schede/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/domande/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/servizi/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/titoli/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/mainapp/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/siticatasto/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/SITIControlli/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/siti-farmer/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/siti-knowledge/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/siti-knowledge-metadata/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/siti-reports/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/SSO/WEB-INF/classes/log4j.properties')
    should contain_file('/opt/tomcat6/webapps/sitiAgriMenu/WEB-INF/web.xml')
    should contain_file('/opt/tomcat6/webapps/DbMAP_WMS/WEB-INF/web.xml').
      with_content(/DbMAP_WMS_servlet.management.ManagementServlet/)
  end
end
