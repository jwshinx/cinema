module Technology
  def self.included(base) 
    base.extend ClassMethods
  end
                             
  module ClassMethods 
    %w[laserdisc blue_ray high_definition].each do |type|
      code = %Q{
        def has_#{type}_version_if(&check) 
          define_method "is_available_in_#{type}?" do 
            (check.call(year)) ? true : false  
          end
        end
      }
      eval code
    end 
  end
end