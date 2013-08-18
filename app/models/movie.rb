class Movie < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :year   
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
   
  validates :title, :description, :category_id, :presence => true
  belongs_to :category                     
  has_many :actors, :through => :actings
  has_many :actings
  
  before_validation do |object|
    object.description = "description of #{object.title}" if object.description.blank?
  end     
  
end
