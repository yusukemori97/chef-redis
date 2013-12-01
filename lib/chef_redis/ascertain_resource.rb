require 'redis'
require_relative 'helpers'

module ChefRedis
  class AscertainResource

    def initialize(*args)
    end

    include ChefRedis::Helpers

    def configuration
    end

    def running?
    end

    def primary?
    end

    def secondary?
    end

    def cluster?
    end

    private

    def load_configuration
      config_from_redis if is_running?
    end

    def is_running?
      begin
        true if redis_handle.ping
      rescue Redis::ConnectionError
        puts 'Raise the roof!'
      rescue Redis::CommandError
        puts 'Raise the roof!'
      end
    end

    def is_secodary?
    end

    def is_primary?
    end

    def is_cluster?
    end

    def config_from_redis
      redis_handle.config(:get, '*')
    end

    def config_from_file
    end

    def redis_handle
      @redis ||= try_redis
    end

    def try_redis
      begin
        Redis.new
      rescue Redis::CannotConnectError
        puts 'Raise the roof!'
      end
    end
  end
end