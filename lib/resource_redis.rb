require 'chef/resource'

class Chef
  class Resource
    class Redis < Chef::Resource

      def initialize(*args)
        super
        @action = :create
      end

      state_attrs(
          :configuration,
          :running?,
          :primary?,
          :secondary?,
          :cluster?
      )
      actions :create, :destroy

      attribute :name, :kind_of => String, :name_attribute => true
      attribute :user, :kind_of => String, :default => 'redis'
      attribute :group, :kind_of => String, :default => 'redis'

      attribute :install_type, kind_of: String, default: 'package'
      attribute :install_options, kind_of: Hash
      attribute :service_type, kind_of: String, default: 'init'
      attribute :service_options, kind_of: Hash
    end
  end
end
