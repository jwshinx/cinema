require 'spec_helper'

describe Actor do
  let(:actor) { Actor.new firstname: 'brad', lastname: 'pitt', highest_pay: 23 }      
  it "invalid without firstname" do
    actor.firstname = ''
    actor.should_not be_valid
  end
  it "invalid without lastname" do
    actor.lastname = ''
    actor.should_not be_valid
  end
  it "invalid without highest pay" do
    actor.highest_pay = ''
    actor.should_not be_valid
  end
  it "returns fullname brad pitt" do
    actor.fullname.should == 'Brad Pitt'
  end
end

# == Schema Information
#
# Table name: actors
#
#  id          :integer          not null, primary key
#  firstname   :string(255)
#  lastname    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  highest_pay :integer
#

