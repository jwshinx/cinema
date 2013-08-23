module Movieable
  def movie_titles
    movies.map(&:title)   
  end
end