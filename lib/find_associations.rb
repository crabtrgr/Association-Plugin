module FindAssociations
  class InstanceMethods
    def find_associations
      self.class.reflect_on_all_associations.collect{|c| c.name}
    end
    def find_associations_by_type(type)
      self.class.reflect_on_all_associations.select{|c| c.name if c.macro == type}
    end
    def find_associations_without_type(type)
      self.class.reflect_on_all_associations.select{|c| c.name unless c.macro == type}
    end
  end
end