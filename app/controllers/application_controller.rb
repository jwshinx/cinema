class ApplicationController < ActionController::Base
  protect_from_forgery     
  before_filter :get_all_movie_years
  
  def get_all_movie_years
    @movie_years = Movie.order('year desc').all.map{|m| m.year}.uniq
  end
end
