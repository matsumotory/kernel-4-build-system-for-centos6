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

git build_dir do
  repository "https://github.com/matsumoto-r/build-kernel-4.x-for-centos6.git"
end

execute "setup building kernel" do
  command "chown -R #{node["rbenv"]["user"]}.#{node["rbenv"]["user"]} #{build_dir} /home/#{node["rbenv"]["user"]}/rpmbuild"
end

execute "build kernel" do
  user node["rbenv"]["user"]
  command "cd #{build_dir} && make && mv #{build_dir}/build/linux-4.1.1 ~/."
end
