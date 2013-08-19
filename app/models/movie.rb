class Movie < ActiveRecord::Base
  include Flare  
  include Technology 
                                                                               
  has_laserdisc_version_if { |year| year > 1980 }
  has_high_definition_version_if { |year| year > 2000 }                                                
  has_blue_ray_version_if { |year| year > 2010 }                        
  
  attr_accessible :category_id, :description, :title, :year, :gross   
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
   
  validates :title, :description, :category_id, :presence => true
  belongs_to :category                     
  has_many :actors, :through => :actings
  has_many :actings, dependent: :destroy
  
  before_validation do |object|
    object.description = "description of #{object.title}" if object.description.blank?
  end     
         
  #scope :of_year, lambda { |year| where('year = ?', year)} 
  scope :of_year, ->(year) { where("year = ?", year) }     
  scope :by_oldest, order("year asc")   
  scope :by_newest, order("year desc")                                                                       
  scope :between, ->(old_year, new_year) { where("year >= ? and year <= ?", old_year, new_year)}
  def to_s
    "Title: #{title}"
  end
end
