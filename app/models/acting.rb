class Acting < ActiveRecord::Base
  attr_accessible :actor_id, :movie_id, :payment  
  validates :payment, :presence => true
  validates :payment, numericality: { only_integer: true }                                                                                                
  belongs_to :actor
  belongs_to :movie
end

# == Schema Information
#
# Table name: actings
#
#  id         :integer          not null, primary key
#  actor_id   :integer
#  movie_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  payment    :integer
#

