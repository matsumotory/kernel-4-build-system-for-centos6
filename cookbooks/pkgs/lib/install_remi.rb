define :install_epel_repository do
  execute "setup epel GPC Key" do
    not_if 'rpm -qa | grep -q "epel-release-6-8.noarch"'
    command 'rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  end

  execute "setup epel repository configuration" do
    not_if 'rpm -qa | grep -q "epel-release-6-8.noarch"'
    command 'rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
  end
end

define :install_remi_repository do

  # depend on epel repositry
  install_epel_repository "epel"

  execute "setup remi GPG key" do
    not_if 'rpm -qa | grep -q "remi-release-6"'
    command 'rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  end

  execute "setup remi repository configuration" do
    not_if 'rpm -qa | grep -q "remi-release-6"'
    command 'rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm'
  end
end

