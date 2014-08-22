#
# Cookbook Name:: redis
# Recipe:: _server_install_from_source

include_recipe "build-essential"

redis_source_tarball = "redis-#{node.redis.source.version}.tar.gz"
redis_source_url = "#{node.redis.source.url}/#{redis_source_tarball}"

user node.redis.user

%w[ dst_dir src_dir conf_dir ].each do |dir|
  directory node.redis[dir] do
    owner node.redis.user
    group node.redis.group
    action :create
  end
end

execute "install-redis" do
  cwd node.redis.src_dir
  command "make PREFIX=#{node.redis.dst_dir} install"
  creates "#{node.redis.dst_dir}/redis-server"
  user node.redis.user
  action :nothing
end

execute "make-redis" do
  cwd node.redis.src_dir
  command "make"
  creates "redis"
  user node.redis.user
  action :nothing
  notifies :run, "execute[install-redis]", :immediately
end

execute "redis-extract-source" do
  command "tar zxf #{Chef::Config.file_cache_path}/#{redis_source_tarball} --strip-components 1 -C #{node.redis.src_dir}"
  creates "#{node.redis.src_dir}/COPYING"
  only_if do File.exist?("#{Chef::Config.file_cache_path}/#{redis_source_tarball}") end
  action :run
  notifies :run, "execute[make-redis]", :immediately
end

cookbook_file "#{redis_source_tarball}" do
	path "#{Chef::Config.file_cache_path}/#{redis_source_tarball}"
	mode "0755"
	owner "root"
	group "root"
	action :create
	notifies :run, "execute[redis-extract-source]", :immediately
end

["redis-server", "redis-cli"].each do |item|
  link "/sbin/#{item}" do
    to "#{node.redis.dst_dir}/bin/#{item}"
    only_if { node.redis.symlink_binaries }
  end
end

