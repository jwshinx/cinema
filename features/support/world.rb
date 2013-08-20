module MyHelper
  def sayhi
    'hi'
  end         
  def create_actor name, pay
    tokens = name.split(' ')
    Actor.create({ firstname: tokens[0], lastname: tokens[1], highest_pay: pay})
  end                                                                                                               
  def create_movie t, d, g, y, cat
    Movie.create({ title: t, description: d, gross: g, year: y, category_id: cat.id})
  end  
  def create_acting a, m
    Acting.create({actor_id: a.id, movie_id: m.id})
  end
end                                                                                      

World(MyHelper)