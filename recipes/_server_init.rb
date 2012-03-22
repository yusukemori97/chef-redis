#
# Cookbook Name:: redis
# Recipe:: _server_init

template "redis_init" do
  path "/etc/init.d/redis"
  source "redis_init.erb"
  owner "root"
  group "root"
  mode 0755
end

service "redis" do
  action [ :enable, :start ]
end
