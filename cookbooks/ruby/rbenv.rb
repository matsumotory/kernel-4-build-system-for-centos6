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

git node["rbenv"]["rbenv_dir"] do
  repository "https://github.com/sstephenson/rbenv.git"
  revision "5b9e4f05846f6bd03b09b8572142f53fd7a46e62"
  not_if "test -d #{node["rbenv"]["rbenv_dir"]}"
end

git node["rbenv"]["rubybuild_dir"] do
  repository "https://github.com/sstephenson/ruby-build.git"
  revision "83beb8bcc2f57a9465108abfc3c65eb3f9ce9cb4"
  not_if "test -d #{node["rbenv"]["rubybuild_dir"]}"
end

execute "setup rbenv owner" do
  command "chown -R #{node["rbenv"]["user"]}.#{node["rbenv"]["user"]} #{node["rbenv"]["rbenv_dir"]}"
end

execute "setup rbven dir" do
  user node["rbenv"]["user"]
  command "cp -r #{node["rbenv"]["rbenv_dir"]} ~/.rbenv"
  not_if "test -d ~/.rbenv"
end

execute "setup rbenv PATH into #{node["rbenv"]["rbenv_config_file"]}" do
  user node["rbenv"]["user"]
  command "echo 'export PATH=$HOME/.rbenv/bin:$PATH' >> #{node["rbenv"]["rbenv_config_file"]}"
  not_if "grep 'export PATH=$HOME/.rbenv/bin:$PATH' -q #{node["rbenv"]["rbenv_config_file"]}"
end

execute "setup rbenv init into #{node["rbenv"]["rbenv_config_file"]}" do
  user node["rbenv"]["user"]
  command "echo 'eval \"$(rbenv init -)\"' >> #{node['rbenv']["rbenv_config_file"]}"
  not_if "grep 'eval \"$(rbenv init -)\"' #{node['rbenv']["rbenv_config_file"]}"
end

execute "reload #{node["rbenv"]["rbenv_config_file"]}" do
  user node["rbenv"]["user"]
  command "source #{node["rbenv"]["rbenv_config_file"]}"
end

