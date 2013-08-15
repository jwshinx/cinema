require 'spec_helper'

describe "movies/edit" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :title => "MyString",
      :description => "MyString",
      :category_id => 1
    ))
  end

  it "renders the edit movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do
      assert_select "input#movie_title[name=?]", "movie[title]"
      assert_select "input#movie_description[name=?]", "movie[description]"
      assert_select "input#movie_category_id[name=?]", "movie[category_id]"
    end
  end
end
