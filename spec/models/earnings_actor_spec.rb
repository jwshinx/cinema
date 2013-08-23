require 'spec_helper'

describe Actor do
  let(:actor) { Actor.new firstname: 'brad', lastname: 'pitt' }
  describe "when cast of" do
    describe "no movies" do
      it "returns 0 " do 
        coll = double('array')
        coll.should_receive(:empty?).and_return(true)
        actor.stub movies: coll
        actor.total_gross_of_movies( actor.movies, :gross ){ actor.movies.empty? }.should == 0                          
      end  
    end
    describe "one movie" do
      it "returns 10" do
        coll = double('array', empty?: false, map: double('array', inject: 10 ))      
        actor.stub movies: coll
        actor.total_gross_of_movies( actor.movies, :gross ){ actor.movies.empty? }.should == 10                          
      end
    end
    describe "two movies" do
      it "returns 20" do  
        coll = double('array', empty?: false, map: double('array', inject: 20 ))      
        actor.stub movies: coll
        actor.total_gross_of_movies( actor.movies, :gross ){ actor.movies.empty? }.should == 20                          
      end
    end     
    describe "total gross of movies" do
      it "returns 300" do
        a = FactoryGirl.create(:actor_of_many_movies)
        a.total_gross_of_movies( a.movies, :gross ){ a.movies.empty? }.should == 300                          
      end
    end
  end 
  describe "total earned" do
    it "returns 2" do                           
      a = FactoryGirl.create(:actor_of_two_movies)
      a.total_earned( a.actings, :payment ){ a.movies.empty? }.should == 2                                         
    end
  end
end