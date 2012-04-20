#
# Cookbook Name:: redis
# Recipe:: _server_service

service "redis" do
  action [ :enable, :start ]
end
