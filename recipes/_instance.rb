redis_instance "instance" do
  conf_dir      node.redis.conf_dir
  init_style    node.redis.init_style

  # user service & group
  user          node.redis.user
  group         node.redis.group

  # configuration configuration
  appendonly     node.redis.config.appendonly
  appendfsync    node.redis.config.appendfsync
  daemonize      node.redis.config.daemonize
  databases      node.redis.config.databases
  dbfilename     node.redis.config.dbfilename
  dir            node.redis.config.dir
  listen_addr    node.redis.config.listen_addr
  listen_port    node.redis.config.listen_port
  logfile        node.redis.config.logfile
  loglevel       node.redis.config.loglevel
  pidfile        node.redis.config.pidfile
  rdbcompression node.redis.config.rdbcompression
  timeout        node.redis.config.timeout
  vm_enabled        node.redis.config.vm.enabled
  vm_max_memory     node.redis.config.vm.max_memory
  vm_max_threads    node.redis.config.vm.max_threads
  vm_page_size      node.redis.config.vm.page_size
  vm_pages          node.redis.config.vm.pages
  vm_swap_file      node.redis.config.vm.vm_swap_file

  ###
  ## following the configuration settings may only work with a recent redis release
  ###
  configure_slowlog       node.redis.config.configure_slowlog
  slowlog_log_slower_than node.redis.config.slowlog_log_slower_than
  slowlog_max_len         node.redis.config.slowlog_max_len

  configure_maxmemory_samples          node.redis.config.configure_maxmemory_samples
  maxmemory_samples                    node.redis.config.maxmemory_samples

  configure_no_appendfsync_on_rewrite  node.redis.config.configure_no_appendfsync_on_rewrite
  no_appendfsync_on_rewrite            node.redis.config.no_appendfsync_on_rewrite

  configure_list_max_ziplist           node.redis.config.configure_list_max_ziplist
  list_max_ziplist_entries             node.redis.config.list_max_ziplist_entries
  list_max_ziplist_value               node.redis.config.list_max_ziplist_value

  configure_set_max_intset_entries     node.redis.config.configure_set_max_intset_entries
  set_max_intset_entries               node.redis.config.set_max_intset_entries
end
