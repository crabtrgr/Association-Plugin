module FindAssociations
  module InstanceMethods
    def find_associations
      self.class.reflect_on_all_associations.collect{|c| c.name}
    end
    def find_associations_by_type(type)
      self.class.reflect_on_all_associations.select{|c| c.name if c.macro == type}
    end
    def find_associations_without_type(type)
      self.class.reflect_on_all_associations.select{|c| c.name unless c.macro == type}
    end
    def has_associated_records?
      self.find_associations.inject(false){|result,element| result ||= !self.send(element.to_s).to_a.empty?}
    end
  end
end