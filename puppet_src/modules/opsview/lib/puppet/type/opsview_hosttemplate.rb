Puppet::Type.newtype(:opsview_hosttemplate) do
  @doc = "Manages hosttemplates in an Opsview monitoring system"

  ensurable

  newparam(:name, :namevar => true) do
  end
  
  newparam(:reload_opsview) do
    desc "True if you want an Opsview reload to be performed when the hosttemplate is updated"
  end
  
  newproperty(:hosttemplate) do
    desc "This hosttemplate"
  end
  
  newproperty(:description) do
    desc "description for this hosttemplate"
  end
  
  newproperty(:servicechecks, :array_matching => :all) do
    desc "Array of servicechecks for this hosttemplate.  The list must be in
          alphabetical order, otherwise the config will be re-applied everytime
          puppet runs."
  end

  newproperty(:managementurls, :array_matching => :all) do
    desc "Array of management urls for this hosttemplate"
  end
  
  autorequire(:opsview_servicecheck) do
    self[:servicechecks]
  end
  
end
