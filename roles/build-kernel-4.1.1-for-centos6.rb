include_recipe "../cookbooks/pkgs/pkgs.rb"
include_recipe "../cookbooks/pkgs/remi_pkgs.rb"
include_recipe "../cookbooks/pkgs/epel_pkgs.rb"
include_recipe "../cookbooks/pkgs/source.rb"

include_recipe "../cookbooks/kernel/kernel-4.1.1.rb"
