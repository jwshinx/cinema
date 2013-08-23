module Earnings    
  
  def total_earned collection, attribute
    return 0 if yield
    collection.map{|a| a.send(attribute) }.inject(:+)  
  end
   
  alias_method :total_gross_of_movies, :total_earned
end