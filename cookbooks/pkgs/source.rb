hiredis_dir = "/usr/local/src/hiredis"

git hiredis_dir do
  repository "https://github.com/redis/hiredis.git"
  # version 0.13.1
  revision "f58dd249d6ed47a7e835463c3b04722972281dbb"
end

execute "install hiredis" do
  command "cd #{hiredis_dir} && make && make install"
end

remote_file "/etc/ld.so.conf.d/local_lib.conf" do
  action :create
end

execute "update ld.so.cache" do
  command "ldconfig"
end
