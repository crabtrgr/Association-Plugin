require "find_associations"
ActiveRecord::Base.send(:include, FindAssociations::InstanceMethods)