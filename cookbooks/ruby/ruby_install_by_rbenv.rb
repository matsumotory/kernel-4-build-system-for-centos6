node ||= {
  "rbenv" => {
    "versions" => [ "2.2.2" ],
    "local" => "2.2.2",
    "gems" => [ "bundler", "rake" ],
    "user" => "vagrant",
    "rbenv_config_file" => "~/.bash_profile",
    "rbenv_dir" => "/var/tmp/rbenv",
    "rubybuild_dir" => "/var/tmp/rbenv/plugins/ruby-build",
  },
}

node["rbenv"]["versions"].each do |version|
  execute "install ruby #{version}" do
    user node["rbenv"]["user"]
    command "export TMPDIR=/var/tmp; source ~/.bash_profile; rbenv install #{version}"
    not_if "export TMPDIR=/var/tmp; source ~/.bash_profile; rbenv versions | grep #{version}"
  end
end

execute "set local ruby #{node["rbenv"]["local"]}" do
  user node["rbenv"]["user"]
  command "export TMPDIR=/var/tmp; source ~/.bash_profile; rbenv local #{node["rbenv"]["local"]}; rbenv rehash"
  not_if "export TMPDIR=/var/tmp; source ~/.bash_profile; rbenv local | grep #{node["rbenv"]["local"]}"
end

node["rbenv"]["gems"].each do |gem|
  execute "gem install #{gem}" do
    user node["rbenv"]["user"]
    command "export TMPDIR=/var/tmp; source ~/.bash_profile; gem install #{gem}; rbenv rehash"
    not_if "export TMPDIR=/var/tmp; source ~/.bash_profile; gem list | grep #{gem}"
  end
end

