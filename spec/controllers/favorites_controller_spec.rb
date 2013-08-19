require 'spec_helper'

describe FavoritesController do

  describe "GET 'favorite_actor'" do
    it "returns http success" do
      get 'favorite_actor'
      response.should be_success
    end
  end

end
