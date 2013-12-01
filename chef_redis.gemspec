require './lib/chef_redis/version'
files_glob = Dir.glob('{lib,test}/**/*').reject { |f| File.directory?(f) }
all_files  = %w(Rakefile LICENSE README.md CONTRIBUTING.md) + files_glob

LIB_NAME = 'chef_redis'

Gem::Specification.new do |gem|
  gem.name          = LIB_NAME
  gem.version       = ChefRedis::VERSION
  gem.summary     = 'Resource Providers to manage Redis'
  gem.description = 'Chef Resource Providers to manage Redis'
  gem.authors       = ['Miah Johnson']
  gem.email         = 'miah@chia-pet.org'
  gem.files = all_files
  gem.homepage    = 'https://github.com/miah/chef_redis'
  gem.license       = 'Apache-2.0'
  gem.require_paths = ['lib', "lib/#{ LIB_NAME }", "lib/#{ LIB_NAME }/templates"]
  gem.add_runtime_dependency 'chef'
  gem.add_runtime_dependency 'redis', '>= 3.0.6'
  gem.add_development_dependency 'rubysl', '~> 2.0' if RUBY_ENGINE = 'rbx'
end