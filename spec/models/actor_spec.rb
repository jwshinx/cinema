require 'spec_helper'

describe Actor do
  let(:actor) { Actor.new firstname: 'brad', lastname: 'pitt' }      
  it "invalid without firstname" do
    actor.firstname = ''
    actor.should_not be_valid
  end
  it "invalid without lastname" do
    actor.lastname = ''
    actor.should_not be_valid
  end
  it "returns fullname brad pitt" do
    actor.fullname.should == 'Brad Pitt'
  end 
  describe "with factory girl" do
    it "returns movies" do
      a = FactoryGirl.create(:actor_of_many_movies)
      a.movies.first.should be_instance_of Movie
    end
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

