require 'spec_helper'

describe "actors/new" do
  before(:each) do
    assign(:actor, stub_model(Actor,
      :firstname => "MyString",
      :lastname => "MyString"
    ).as_new_record)
  end

  it "renders new actor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", actors_path, "post" do
      assert_select "input#actor_firstname[name=?]", "actor[firstname]"
      assert_select "input#actor_lastname[name=?]", "actor[lastname]"
    end
  end
end
