require 'spec_helper'

describe Category do 
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
