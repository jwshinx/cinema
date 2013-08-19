require 'spec_helper'

describe Movie do              
  let(:movie) { Movie.new title: 'patch', description: '', category_id: 1, year: 2010, gross: 25 }
  it "invalid without title" do
    movie.title = ''
    movie.should_not be_valid
  end
  it "valid without description" do
    movie.description = '' 
    movie.should be_valid
  end       
  it "returns description-of-title when description is blank" do
    movie.description = ''
    movie.save 
    movie.description.should == 'description of patch'
  end  
  it "invalid without year" do  
    movie.year = '' 
    movie.should_not be_valid       
  end
  it "invalid without gross" do  
    movie.gross = '' 
    movie.should_not be_valid       
  end

end

# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#  year        :integer
#  gross       :integer
#

