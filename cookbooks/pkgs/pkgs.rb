execute "update packages" do
  command 'yum -y update'
end

%w{

  libcap-devel
  openssl-devel
  libffi-devel
  libcgroup-devel
  libxml2-devel
  bzip2-devel
  libcurl-devel
  re2c
  libjpeg-devel
  libpng-devel
  libXpm-devel
  freetype-devel
  libc-client-devel
  libmcrypt-devel
  postgresql-devel
  libtidy-devel
  libxslt-devel
  sqlite-devel
  GeoIP-devel
  readline-devel
  pcre-devel
  wget
  bc
  ncurses-devel

}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "group install Development Tools" do
  command 'yum -y --enablerepo=C6.4-updates groupinstall "Development Tools"'
end

