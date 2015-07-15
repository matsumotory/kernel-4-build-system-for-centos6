include_recipe "lib/install_remi.rb"

install_remi_repository "remi"

remote_file "/etc/yum.repos.d/epel.repo" do
  action :create
  mode "0644"
  owner "root"
  group "root"
end

%w{

  libmemcached-last-devel
  ccache

}.each do |pkg|
  package pkg do
     action :install
     options "--enablerepo=remi"
  end
end

