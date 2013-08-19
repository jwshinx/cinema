class Actor < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :highest_pay, :actings_attributes                                                               
  validates :firstname, :lastname, :highest_pay, :presence => true           
  has_many :movies, :through => :actings
  has_many :actings, dependent: :destroy       
  
  accepts_nested_attributes_for :actings, :allow_destroy => true, :reject_if => lambda { |a| a[:movie_id].blank? }
                                                                                                                                      
  def to_s
    "Name: #{fullname}"
  end
  def fullname
    "#{firstname.capitalize} #{lastname.capitalize}"
  end    
end
