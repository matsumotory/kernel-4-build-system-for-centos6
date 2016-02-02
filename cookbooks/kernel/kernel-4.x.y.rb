node ||= {
  "rbenv" => {
    "versions" => [ "2.2.1", "2.2.2" ],
    "local" => "2.2.2",
    "gems" => [ "bundler", "rake" ],
    "user" => "vagrant",
    "rbenv_config_file" => "~/.bash_profile",
    "rbenv_dir" => "/var/tmp/rbenv",
    "rubybuild_dir" => "/var/tmp/rbenv/plugins/ruby-build",
  },
}

build_dir = "/usr/local/src/kernel-build"
version = ENV["KERNEL_VER"].nil? ? "4.1.1" : ENV["KERNEL_VER"]
host = ENV["KERNEL_BUILD_HOST"].nil? ? "" : ENV["KERNEL_BUILD_HOST"]
user = ENV["KERNEL_BUILD_USER"].nil? ? "" : ENV["KERNEL_BUILD_USER"]
prefix = ENV["KERNEL_LOCAL_VER"].nil? ? "" : ENV["KERNEL_LOCAL_VER"]

git build_dir do
  repository "https://github.com/matsumoto-r/build-kernel-4.x-for-centos6.git"
end

execute "setup building kernel" do
  command "chown -R #{node["rbenv"]["user"]}.#{node["rbenv"]["user"]} #{build_dir} /home/#{node["rbenv"]["user"]}/rpmbuild"
end

execute "build kernel" do
  user node["rbenv"]["user"]
  command "cd #{build_dir} && make THREAD=2 KERNEL_VER=#{version} KERNEL_BUILD_HOST=#{host} KERNEL_BUILD_USER=#{user} KERNEL_LOCAL_VER=#{prefix} && cp -prfv #{build_dir}/build/linux-#{version} /vagrant/build/. "
end
