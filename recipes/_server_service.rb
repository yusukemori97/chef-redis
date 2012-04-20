#
# Cookbook Name:: redis
# Recipe:: _server_service

service "redis" do
  service_name node['platform'] =~ /ubuntu|debian/ ? "redis-server" : "redis"
  action [ :enable, :start ]
end
