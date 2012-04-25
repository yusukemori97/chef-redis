require "chefspec"

describe "redis::_server_init" do
  let (:chef_run) {ChefSpec::ChefRunner.new.converge 'redis::_server_init'}
  it "should create directory /etc/redis" do
    chef_run.node.redis.conf_dir = '/etc/redis'
    chef_run.should create_directory '/etc/redis'
  end
  it "should create directory /var/lib/redis" do
    chef_run.node.redis.config.dir = '/var/lib/redis'
    chef_run.should create_directory '/var/lib/redis'
  end
  it "should set owner 'root' and group 'root' on /etc/redis" do
    chef_run.file('/etc/redis').should be_owned_by('root', 'root')
  end
  it "should set owner 'root' and group 'root' on /var/lib/redis" do
    chef_run.file('/var/lib/redis').should be_owned_by('root', 'root')
  end
  it "should create /etc/redis/redis.conf" do
    chef_run.should create_file '/etc/redis/redis.conf'
  end
  it "should set permission mode 0755 on /etc/redis" do
  end
  it "should set permission mode 0755 on /var/lib/redis" do
  end
end
