def load_current_resource
  new_resource.user         new_resource.user  || node.redis.user
  new_resource.group        new_resource.group || node.redis.group

  new_resource.state # Load attributes
end

action :create do
  create_config
  new_resource.updated_by_last_action(true)
end

action :destroy do
  new_resource.updated_by_last_action(true)
end

def create_config
end
