#
# Cookbook Name:: redis
# Recipe:: _server_service

service "redis" do
  service_name "redis-server"
  action [ :enable, :start ]
end
