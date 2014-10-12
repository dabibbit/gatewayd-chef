i# Setup repository for non-capistrano
git "/home/ubuntu/gatewayd" do
  repository "https://github.com/ripple/gatewayd"
  revision "master"
  action :sync
end

# Setup deploy directory for Capistrano
directory "/opt/gatewayd" do
  owner "ubuntu"
  action :create
end
directory "/tmp/gatewayd" do
  owner "ubuntu"
  action :create
end

# Start gatewayd on startup
template "/etc/init.d/gatewayd" do
  source "init.d/gatewayd.erb"
  action :create
end

