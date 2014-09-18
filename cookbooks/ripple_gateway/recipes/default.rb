include_recipe "git"
include_recipe "nodejs"
include_recipe "nginx"
include_recipe "apt"
include_recipe "postgres::client"
include_recipe "upstart"

directory "/var/www/ripple_gateway" do
  owner "ubuntu"
  mode "0777"
end

