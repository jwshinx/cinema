require 'spec_helper'

describe Movie do              
  
  it "invalid without title" do
    movie = Movie.new title: '', description: '', category_id: 1
    movie.should_not be_valid
  end
  it "valid without description" do
    movie = Movie.new title: 'patch', description: '', category_id: 1
    movie.should be_valid       
    movie.description.should == 'description of patch'
  end
end
