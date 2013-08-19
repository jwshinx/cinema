module Flare
  def with_dashes
    x = "--- "        
    #x << yield
    x << " ---"
    x
  end   
  def with_dots
    x = "... "
    x << yield 
    x << ' ...'
  end
end