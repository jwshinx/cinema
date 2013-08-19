module Decoration
  def with_brackets
    x = "<<< #{title}"
    #x << yield 
    x << ' >>>'
  end
  
end    