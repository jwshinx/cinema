require 'acceptance/acceptance_helper'

feature 'Category feature', %q{
  In order to ...
  As a ...
  I want ...
} do

  scenario 'show show a category' do  
    c = create_category 'drama', 'blah' 
    visit "/categories/#{c.id}"
    page.should have_content("drama")
    page.should have_content("blah")
  end

  scenario 'add a category' do 
    visit "/categories/new"
    fill_in 'category[name]', :with => 'comedy'
    fill_in 'category[description]', :with => 'funny stuff'
    click_button "Save"                                    
    should_be_on "/categories/#{Category.find_by_name('comedy').slug}"
    page.should have_content("comedy")
    page.should have_content("funny stuff")
  end

  scenario 'edit a category' do 
    c = create_category 'drama', 'blah' 
    visit "/categories/#{c.slug}/edit/"
    fill_in 'category[name]', :with => 'serious'
    fill_in 'category[description]', :with => 'funny stuff'
    click_button "Save"                                    
    should_be_on "/categories/#{Category.find_by_name('serious').slug}"
    page.should have_content("serious")
    page.should have_content("funny stuff")
  end

  scenario 'cannot edit a category without a name' do 
    c = create_category 'drama', 'blah' 
    visit "/categories/#{c.slug}/edit/"
    fill_in 'category[name]', :with => ''
    fill_in 'category[description]', :with => 'funny stuff'
    click_button "Save"                                    
    should_be_on "/categories/#{c.slug}"
    page.should have_content("error")
    page.should have_content("Name can't be blank")
  end

end
