package "nginx"

service "nginx" do
  action :enable
end

template "/etc/nginx/sites-available/default" do
  source "sites-available.erb"
end

service "nginx" do
  action :reload
end

directory "/var/www" do
 owner "deploy"
 action :create
end

template "/var/www/index.html" do
  source "index.html.erb"
end

service "nginx" do
  action :restart
end


#service "dogecoin_gateway" do
#  provider Chef::Provider::Service::Upstart
#  action :start
#end


