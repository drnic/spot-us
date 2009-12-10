module HumanMethods
  def dehumanize(string)
    string.gsub(/\W+/,'_')
  end

  def human_route(name)
    send("#{dehumanize(name).sub(/^home$/,'root')}_path")
  end
  
  def human_route_for_current(name)
    instance = name.split(' ').last
    instance = "@#{instance}"
    send("#{dehumanize(name)}_path", instance_variable_get(instance))
  end
end

module HelperMethods
  def set_instance_variable(name, value)
    instance_variable_name = "@#{name}"
    instance_variable_set(instance_variable_name, value)
  end
  def get_instance_variable(name)
    instance_variable_name = "@#{name}"
    instance_variable_get(instance_variable_name)
  end
end

World(HumanMethods)
World(HelperMethods)

