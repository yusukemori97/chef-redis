require "chefspec"

describe "redis::_server_init" do
  let (:chef_run) {ChefSpec::ChefRunner.new.converge 'redis::_server_init'}
  it "should create /etc/init.d/redis-server" do
    chef_run.should create_file '/etc/init.d/redis-server'
  end
  it "should set owner 'root' on /etc/init.d/redis-server" do
    chef_run.file('/etc/init.d/redis-server').should be_owned_by('root', 'root')
  end
  it "should set permission mode 0755 on /etc/init.d/redis-server" do
  end
end
