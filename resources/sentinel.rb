actions   :create, :destroy

# House keeping
attribute :name,  :kind_of => String, :name_attribute => true
attribute :user,  :kind_of => String, :default => "redis"
attribute :group, :kind_of => String, :default => "redis"
attribute :init_style,    :kind_of => String, :default => "init"
attribute :pidfile,       :kind_of => String
attribute :daemonize,     :kind_of => [TrueClass, FalseClass], :default => true

# Interesting part
attribute :master_name,             :kind_of => String
attribute :monitor,                 :kind_of => Hash # TODO validate name, address, port, quorum
attribute :down_after_milliseconds, :kind_of => Fixnum, :default => 60000
attribute :failover_timeout,        :kind_of => Fixnum, :default => 900000
attribute :can_failover,            :kind_of => [TrueClass, FalseClass], :default => true
attribute :parallel_syncs,          :kind_of => Fixnum, :default => 1
attribute :quorum,                  :kind_of => Fixnum, :default => 2
attribute :port,                    :kind_of => Fixnum, :default => 26379

# Example generated config
#sentinel monitor mymaster 127.0.0.1 6379 2
#sentinel down-after-milliseconds mymaster 60000
#sentinel failover-timeout mymaster 900000
#sentinel can-failover mymaster yes
#sentinel parallel-syncs mymaster 1

def initialize(*args)
  super
  @action = :create
end

state_attrs(
  :master_name,
  :monitor,
  :down_after_milliseconds,
  :failover_timeout,
  :can_failover,
  :parallel_syncs,
  :quorum,
  :port,
)
