require_relative '../../../../spec_helper.rb'

describe 'nodes::s_capservices', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('java')
    should contain_class('postfix')
    should contain_class('capdservices')
    should contain_class('capddata')
    should contain_class('capdtasks')
    should contain_class('memcached')
    should contain_class('opsview_agent')
    should contain_class('capdsendmail')
    should contain_class('capdinternalload')
    should contain_class('capdidaprivatebetatokensbatch')
    should contain_class('capdmdmload')
    should contain_class('capdexpirepasswords')
    should contain_class('siti_db')
    should contain_class('siti_sqlplus')
    should contain_class('siti_delete_db')
    should contain_class('sqlplus_client')
    should contain_class('oracle_admin')
    should contain_class('capdinternaluserauth')
    should contain_class('siti_dataloader')
    should contain_class('capdsitisqlldr')
  end
end
