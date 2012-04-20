#
# Cookbook Name:: redis
# Recipe:: _server_service

service "redis-server" do
  action [ :enable, :start ]
end
