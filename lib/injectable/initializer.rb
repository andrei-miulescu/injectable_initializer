#encoding: utf-8

module Injectable
  module Initializer

    def initialize(overwrites = {}, *args)
      set_local_variables(method(:initialize).parameters, args)
      set_instance_variables(defaults.merge(overwrites))
    end

    def set_local_variables(parameters, args)
      parameters.each_with_index do |parameter, index|
        instance_variable_set "@#{parameter.last}", args[index]
        add_reader(parameter.last)
      end
    end

    def set_instance_variables(args)
      args.each do |variable_name, value|
        instance_variable_set "@#{variable_name}", value
        add_reader(variable_name)
      end
    end

    def add_reader(variable_name)
      self.class.class_eval do
        attr_reader variable_name
      end
    end

    def defaults
      raise NotImplementedException "Please implement a #defaults method"
    end

  end
end