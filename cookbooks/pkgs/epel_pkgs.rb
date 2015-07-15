%w{

  ccache

}.each do |pkg|
  package pkg do
     action :install
     options "--enablerepo=epel"
  end
end

