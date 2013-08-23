require 'spec_helper'

describe Actor do
  let(:actor) { Actor.new firstname: 'brad', lastname: 'pitt' }
  describe "list of movies" do
    it "returns as an array" do  
      a = FactoryGirl.create(:actor_of_two_movies)     
      a.movie_titles.should == ['godfather', 'godfather']        
    end  
  end
end