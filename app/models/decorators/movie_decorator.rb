class MovieDecorator                             
  
  def initialize arg1, pre_lambda, post_lambda
    @text = arg1
    @pre = pre_lambda
    @post = post_lambda 
  end
  
  def write 
    x = ''              
    x << @pre.call << @text << @post.call
    #{}"In a world of chaos, #{@text} is one man."    
    x
  end
  
end