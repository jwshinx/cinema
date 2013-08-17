module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.
  def create_category name, desc
    Category.create name: name, description: desc
  end
  def create_movie title, category, desc, year
    c = create_category category, 'fun'
    Movie.create title: title, description: desc, year: year, category_id: c.id
  end  
  def log_out
    visit "/logout"
  end
  def log_in
    visit "/login"
    fill_in "Username", :with => "joel"
    fill_in "Password", :with => "password"
    click_button "Login"
  end
  def create_admin_user
    role = Role.create({name: 'admin', description: 'blah'})
    User.create({
      active: true, username: 'joel', role_id: role.id,
      email: "admin@example.com", password: "password",
      password_confirmation: 'password'
    })
  end
  def should_be_on(path)
    page.current_url.should match(Regexp.new(path))
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance