require './lib/chef_redis/version'

LIB_NAME = 'chef_redis'

Gem::Specification.new do |gem|
  gem.name          = LIB_NAME
  gem.version       = ChefRedis::VERSION
  gem.summary     = 'Resource Providers to manage Redis'
  gem.description = 'Chef Resource Providers to manage Redis'
  gem.authors       = ['Miah Johnson']
  gem.email         = 'miah@chia-pet.org'
  gem.files       = 'lib/chef_redis.rb'
  gem.homepage    = 'https://github.com/miah/chef_redis'
  gem.license       = 'Apache-2.0'
  gem.require_paths = ['lib', "lib/#{ LIB_NAME }", "lib/#{ LIB_NAME }/instance"]
  gem.add_runtime_dependency 'chef'
  gem.add_runtime_dependency 'redis', '>= 3.0.6'
end