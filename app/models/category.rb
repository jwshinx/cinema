class Category < ActiveRecord::Base
  attr_accessible :description, :name
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
                                                
  has_many :movies
  
  #def should_generate_new_friendly_id?
  #  new_record?
  #end
end
