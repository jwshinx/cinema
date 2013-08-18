require 'spec_helper'

describe "actors/index" do
  before(:each) do
    assign(:actors, [
      stub_model(Actor,
        :firstname => "Firstname",
        :lastname => "Lastname"
      ),
      stub_model(Actor,
        :firstname => "Firstname",
        :lastname => "Lastname"
      )
    ])
  end

  it "renders a list of actors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
  end
end
