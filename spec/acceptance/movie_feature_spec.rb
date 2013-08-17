require 'acceptance/acceptance_helper'

feature 'Movie feature', %q{
  blah
} do

  scenario 'show movies made in 1980' do    
    d = create_category 'drama', 'dlff'
    m = create_movie 'mickey', 'drama', 'blah', '1980'   
    r = create_movie 'ripley', 'drama', 'blah', '2000' 
    visit "/movies/find_year/1980"
    page.should have_content("mickey")
    page.should_not have_content("ripley")
  end   
end