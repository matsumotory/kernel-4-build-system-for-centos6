build_dir = "/usr/local/src/kernel-build"

git build_dir do
  repository "https://github.com/matsumoto-r/build-kernel-4.x-for-centos6.git"
end

execute "build kernel" do
  command "cd #{build_dir} && make"
end
