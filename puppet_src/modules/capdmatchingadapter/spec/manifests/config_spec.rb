require_relative '../../../../spec_helper.rb'

describe 'capdmatchingadapter::config', type: :class do
  it do
    should contain_file('/opt/capdmatchingadapter').
	    with_ensure('directory')
    should contain_file('/opt/capdmatchingadapter/keys').
      with_ensure('directory')
    should contain_file('/opt/capdmatchingadapter/adapterConfig.yml').
	    with_ensure('present').with_content(/matchingServiceUri: http:\/\/127.0.0.1:8700/)
	should contain_file('/opt/capdmatchingadapter/keys/privateEncryptionKey.pk8.der').with_ensure('present')
	should contain_file('/opt/capdmatchingadapter/keys/privateSigningKey.pk8.der').with_ensure('present')
	should contain_file('/opt/capdmatchingadapter/keys/publicSigningKey.crt').with_ensure('present')
	should contain_file('/opt/capdmatchingadapter/keys/publicEncryptionKey.crt').with_ensure('present')
	should contain_file('/opt/capdmatchingadapter/ida_truststore.ts').with_ensure('present')
  end
end
