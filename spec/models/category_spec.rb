require 'spec_helper'

describe Category do 
  describe "normally" do
    it "invalid without name" do
      c = Category.new name: '', description: 'sdkfl'
      c.should_not be_valid
    end
    it "valid without description" do
      category = Category.new name: 'drama', description: ''
      category.should be_valid       
      category.description.should == 'description of drama'
    end
    it "doesn't create category with invalid name" do
      trying {
       Category.new name: '', description: 'sdkfl'
      }.should_not change(Category, :count).by(1)
    end  
  end
  describe "thru api" do
    it "eee" do  
      pending 'gotta stub this'                                                      
      @drama = FactoryGirl.create(:category)
      response = HTTParty.get("http://localhost:3000/api/v1/categories/#{@drama.id}")
      
      #response = HTTParty.post("http://rubygems.org/api/v1/gems/httparty/owners",
      #    :query => { :email => "alan+thinkvitamin@carsonified.com" })
      #response = HTTParty.get("http://localhost:3000/api/v1/categories/5") 
      puts response.body, response.code, response.message, response.headers.inspect
        
    end                                                                                                                
  end
end

# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#

