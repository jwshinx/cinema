module MyHelper
  def sayhi
    'hi'
  end         
  def create_actor name
    tokens = name.split(' ')
    c = Actor.find_by_firstname_and_lastname tokens[0], tokens[1]
    c || Actor.create({ firstname: tokens[0], lastname: tokens[1]})
  end                                                                                                               
  def create_movie t, d, g, y, cat
    m = Movie.find_by_title t
    m || Movie.create({ title: t, description: d, gross: g, year: y, category_id: cat.id})
  end  
  def create_acting a, m, p
    Acting.create({actor_id: a.id, movie_id: m.id, payment: p})
  end
end                                                                                      

World(MyHelper)