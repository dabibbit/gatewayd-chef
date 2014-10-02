package "nginx"

domain_name = "gatewayd.org"
ssl_dir = "/etc/nginx/ssl"

service "nginx" do
  action :enable
end

template "/etc/nginx/sites-available/default" do
  source "sites-available.erb"
end

directory ssl_dir do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

bash "generate-ssl-files" do
  cwd   ssl_dir
  flags "-e"
  code <<-EOS
    DOM=#{domain_name}
    openssl genrsa -out $DOM.key 4096
    openssl req -new -batch -subj "/CN=$DOM" -key $DOM.key -out $DOM.csr
    openssl x509 -req -days 365 -in $DOM.csr -signkey $DOM.key -out $DOM.crt
    rm $DOM.csr
  EOS
  notifies :reload, "service[nginx]"
  not_if   { ::File.exists?(::File.join(ssl_dir, domain_name + ".crt")) }
end

service "nginx" do
  action :reload
end

service "nginx" do
  action :restart
end

