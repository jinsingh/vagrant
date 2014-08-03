describe 'capapp::package', type: :class do
  it do
    should contain_package('capd-siti-tomcat').with(
      'ensure'   => 'latest',
      'notify'   => 'Service[tomcat6]',
      'require'  => 'Class[Repo]',
      )
  end
end
