#
# Cookbook Name:: redis
# Recipe:: _server_config

directory node['redis']['conf_dir'] do
  owner "root"
  group "root"
  mode 0755
end

template "#{node['redis']['conf_dir']}/redis.conf" do
  source "redis.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables node['redis']['config']
  notifies :restart, "service[redis]", :delayed
end
