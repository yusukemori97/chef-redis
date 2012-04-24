# DESCRIPTION:

Install and configure [Redis](http://redis.io/).

# REQUIREMENTS:

This cookbook has only been tested on Ubuntu 10.04 and 11.04.

## Cookbooks:

* [chef-ark](https://github.com/bryanwb/chef-ark)
* [build-essential](https://github.com/opscode-cookbooks/build-essential)
* [runit](https://github.com/opscode-cookbooks/runit)

# ATTRIBUTES:

## Installation:
* `['redis']['install_type']` - Install the Package by default.
* `['redis']['source']['sha']` - The sha256 checksum of the source tarball.
* `['redis']['source']['url']` - The url to the source tarball.
* `['redis']['source']['version']` - The version of Redis to install.
* `['redis']['src_dir']` - Extract the Redis source to this directory.
* `['redis']['dst_dir']` - Install compiled Redis to this directory.
* `['redis']['conf_dir']` - The Redis configuration directory.
* `['redis']['init_style']` - A value of "init" is currently recommended, but full runit support is coming soon.

## Configuration:

The config file template should support all current configuration options. If we've missed something please file a ticket.

* `['redis']['config']['appendonly']` - Use the AOF file writing system.
* `['redis']['config']['appendfsync']` -
* `['redis']['config']['daemonize']` -
* `['redis']['config']['databases']` -
* `['redis']['config']['dbfilename']` -
* `['redis']['config']['dir']` -
* `['redis']['config']['listen_addr']` - Address to listen on. Defaults to localhost.
* `['redis']['config']['listen_port']` - Port to listen on.
* `['redis']['config']['logfile']` -
* `['redis']['config']['loglevel']` -
* `['redis']['config']['pidfile']` -
* `['redis']['config']['rdbcompression']` -
* `['redis']['config']['timeout']` -
* `['redis']['config']['vm']['enabled']`- Use Redis' virtual memory.
* `['redis']['config']['vm']['max_memory']` -
* `['redis']['config']['vm']['max_threads']` -
* `['redis']['config']['vm']['page_size']` -
* `['redis']['config']['vm']['pages']` -
* `['redis']['config']['vm']['vm_swap_file']` -

The following configuration settings may only work with a recent redis release.

* `['redis']['config']['configure_slowlog']` - 
* `['redis']['config']['slowlog_log_slower_than']` - 
* `['redis']['config']['slowlog_max_len']` - 

# USAGE:

There are several recipes broken up into reusable pieces. For ease of use, we've also included wrappers that map the most common use.

* `redis::_group` - "Creates a group for Redis."
* `redis::_server_config` - "Creates configuration directories and installs templatized redis.conf."
* `redis::_server_init` - "Installs a templatized redis sysv initscript."
* `redis::_server_install_from_package` - "Installs Redis through the chef package resource."
* `redis::_server_install_from_package` - "Downloads, compiles, and installs Redis from source."
* `redis::_server_runit` - "Installs templatized redis runit configuration."
* `redis::_server_service` - "Configures Redis through the chef service resource."
* `redis::_user` - "Creates a user for Redis."
* `redis::default` - "The default recipe executes the redis::server_package recipe."
* `redis::server` - "The default recipe executes the redis::server_package recipe. This recipe is here for compatibility with other community Redis cookbooks."
* `redis::server_package` - "Uses the recipe crumbs in the Redis cookbook to manage a packaged Redis instance."
* `redis::server_source` - "Uses the recipe crumbs in the Redis cookbook to manage a source compiled Redis instance."

The recipe redis::server will install and configure a Redis server.
The recipe redis::server_package will install and configure a Redis server.
The recipe redis::default will install and configure a Redis server.

The recipe redis::server_source will install and configure a Redis server.

# CONTRIBUTE:

# LICENSE & AUTHOR:
Author:: Miah Johnson (<miah@cx.com>)
Copyright:: 2012, CX, Inc
Author:: Noah Kantrowitz (<nkantrowitz@crypticstudios.com>)
Copyright:: 2010, Atari, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
