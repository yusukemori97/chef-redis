#include_recipe "redis::server"

bag = node.redis.data_bag_name

node.redis.instances.each do |instance|
  instance_data = data_bag_item( bag, instance )

  redis_instance instance do
    instance_data.each do |attribute,value|
      send(attribute, value) unless attribute == "id"
    end
  end
end
