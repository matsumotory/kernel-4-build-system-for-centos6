include_recipe "../cookbooks/pkgs/pkgs.rb"
include_recipe "../cookbooks/pkgs/remi_pkgs.rb"
include_recipe "../cookbooks/pkgs/source.rb"

include_recipe "../cookbooks/ruby/rbenv.rb"
include_recipe "../cookbooks/ruby/ruby_install_by_rbenv.rb"

include_recipe "../cookbooks/kernel/kernel-4.1.1.rb"