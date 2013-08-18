require 'spec_helper'

describe "actors/edit" do
  before(:each) do
    @actor = assign(:actor, stub_model(Actor,
      :firstname => "MyString",
      :lastname => "MyString"
    ))
  end

  it "renders the edit actor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", actor_path(@actor), "post" do
      assert_select "input#actor_firstname[name=?]", "actor[firstname]"
      assert_select "input#actor_lastname[name=?]", "actor[lastname]"
    end
  end
end
