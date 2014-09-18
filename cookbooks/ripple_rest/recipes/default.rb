
git "/opt/ripple-rest" do
  repository "https://github.com/ripple/ripple-rest"
  revision "develop"
  action :sync
end

execute "cd /opt/ripple-rest && sudo npm install"

template "/etc/init/ripple_rest.conf" do
  source "ripple_rest.conf.erb"
  action :create
end

execute "sudo start ripple_rest"
