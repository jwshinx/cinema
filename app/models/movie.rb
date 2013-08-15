class Movie < ActiveRecord::Base
  attr_accessible :category_id, :description, :title   
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
   
  belongs_to :category
end
