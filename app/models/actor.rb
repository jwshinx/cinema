class Actor < ActiveRecord::Base  
  include Earnings
  include Movieable
  attr_accessible :firstname, :lastname, :actings_attributes                                                               
  validates :firstname, :lastname, :presence => true           
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

# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  firstname  :string(255)
#  lastname   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

