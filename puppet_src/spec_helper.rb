require 'rspec-puppet'

RSpec.configure do |c|
  c.default_facts = { :hostname => 'test-hostname', :osfamily => 'RedHat'}
  c.module_path = File.join(File.expand_path(File.dirname(__FILE__)), 'modules')
  c.manifest    = File.join(File.expand_path(File.dirname(__FILE__)), 'manifests', 'site_for_tests.pp')
  c.hiera_config = File.join(File.expand_path(File.dirname(__FILE__)), 'spec_hiera.yaml')
  c.treat_symbols_as_metadata_keys_with_true_values = true

  c.before :all do |x|
    #This isn't super intuitive to look at
    #But this is a way of creating a custom Hiera file for the specs so we can test our values
    #Otherwise the specs will die because it doesn't understand eyaml and the like
    #Take the date from the current hiera file
    @here = File.expand_path(File.dirname(__FILE__))

    @hiera_yaml = File.join(@here, 'spec_hiera.yaml')

    unless File.exist?(@hiera_yaml)

      FileUtils.cp(File.join(@here,'hiera.yaml'),@hiera_yaml)

      yamlContent = File.read(@hiera_yaml)

      yamlReplacementContent = yamlContent.gsub(/\/etc\/puppet\//,"#{@here}/")
      # #Remove the eyaml stuff
      yamlReplacementContent = yamlReplacementContent.gsub(/- eyaml/,'')
      yamlReplacementContent = yamlReplacementContent.gsub(/:eyaml:/,'')
      yamlReplacementContent = yamlReplacementContent.gsub(/\s\s:pkcs7_private_key: \/etc\/hiera\/eyaml\/ci_private_key.pem/,'')
      yamlReplacementContent = yamlReplacementContent.gsub(/\s\s:pkcs7_public_key: \/etc\/hiera\/eyaml\/ci_public_key.pem/,'')
      yamlReplacementContent = yamlReplacementContent.gsub(/\/etc\/puppet\//,"#{@here}/")
      yamlReplacementContent = yamlReplacementContent.gsub(/hieradata/,"hieradata_spec/")
      yamlReplacementContent = yamlReplacementContent.gsub(/common/,"spec_common")

      File.open(@hiera_yaml, "w") {|file| file.puts yamlReplacementContent}
    end
  end

  c.before :each do |x|
    # To debug issues, uncomment these lines
    # # This will output the logs to STDOUT
    # Puppet::Util::Log.level = :debug
    # Puppet::Util::Log.newdestination(:console)
  end

  c.after :all do |x|
    # Cleanup src_puppet/spec_hiera.yaml
    FileUtils.rm(@hiera_yaml) if File.exist?(@hiera_yaml)
  end
end
