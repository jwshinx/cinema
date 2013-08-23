class MarketingController < ApplicationController                              
  
  def taglines
                                                              
    @movie_taglines = Movie.all
    
  end
  
end
