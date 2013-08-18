class Actor < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :actings_attributes                                                               
  validates :firstname, :lastname, :presence => true           
  has_many :movies, :through => :actings
  has_many :actings       
  
  accepts_nested_attributes_for :actings, :allow_destroy => true, :reject_if => lambda { |a| a[:movie_id].blank? }
  
end
