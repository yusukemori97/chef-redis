actions :create,  :destroy

attribute :name,  :kind_of => String, :name_attribute => true

attribute :user,  :kind_of => String, :default => "redis"
attribute :group, :kind_of => String, :default => "redis"

attribute :init_style,     :kind_of => String, :default => "init"

# configuration
attribute :appendonly,     :kind_of => String, :default => "no"
attribute :appendfsync,    :kind_of => String, :default => "everysec"
attribute :daemonize,      :kind_of => String, :default => "yes"
attribute :databases,      :kind_of => String, :default => "16"
attribute :dbfilename,     :kind_of => String#, :default => "#{name}.rdb"
attribute :dir,            :kind_of => String, :default => "/var/lib/redis"
attribute :conf_dir,       :kind_of => String, :default => "/etc/redis"
attribute :listen_addr,    :kind_of => String, :default => "127.0.0.1"
attribute :listen_port,    :kind_of => String, :default => "6379"
attribute :logfile,        :kind_of => String#, :default => "/var/log/redis/#{name}.log"
attribute :loglevel,       :kind_of => String, :default => "warning"
attribute :pidfile,        :kind_of => String#, :default => "/var/run/redis/#{name}.pid"
attribute :rdbcompression, :kind_of => String, :default => "yes"
attribute :timeout,        :kind_of => String, :default => "300"
attribute :vm_enabled,     :kind_of => String, :default => "no"
attribute :vm_max_memory,  :kind_of => String, :default => "0"
attribute :vm_max_threads, :kind_of => String, :default => "4"
attribute :vm_page_size,   :kind_of => String, :default => "32"
attribute :vm_pages,       :kind_of => String, :default => "134217728"
attribute :vm_swap_file,   :kind_of => String

###
## the following configuration settings may only work with a recent redis release
###
attribute :configure_slowlog,                   :kind_of => [TrueClass, FalseClass], :default => false
attribute :slowlog_log_slower_than,             :kind_of => String,                  :default => "10000"
attribute :slowlog_max_len,                     :kind_of => String,                  :default => "1024"

attribute :configure_maxmemory_samples,         :kind_of => [TrueClass, FalseClass], :default => false
attribute :maxmemory_samples,                   :kind_of => String,                  :default => "3"

attribute :configure_no_appendfsync_on_rewrite, :kind_of => [TrueClass, FalseClass], :default => false
attribute :no_appendfsync_on_rewrite,           :kind_of => String,                  :default => "no"

attribute :configure_list_max_ziplist,          :kind_of => [TrueClass, FalseClass], :default => false
attribute :list_max_ziplist_entries,            :kind_of => String,                  :default => "512"
attribute :list_max_ziplist_value,              :kind_of => String,                  :default => "64"

attribute :configure_set_max_intset_entries,    :kind_of => [TrueClass, FalseClass], :default => false
attribute :set_max_intset_entries,              :kind_of => String,                  :default => "512"

def initialize(*args)
    super
    @action = :create
end
