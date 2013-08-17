class Category < ActiveRecord::Base
  
  def self.set_attr_accessible attributes
    attributes.each { |attr| attr_accessible attr }   
  end
  set_attr_accessible [:description, :name]
  #attr_accessible :description, :name
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
                                                
  has_many :movies        
  scope :created_on, lambda { |date| where('created_at > ? and created_at < ?', date, date+1)}
  validates :name, :description, :presence => true  

  before_validation do |object|
    object.description = "description of #{object.name}" if object.description.blank?
  end
  
  #def should_generate_new_friendly_id?
  #  new_record?
  #end
 
end                   
                     