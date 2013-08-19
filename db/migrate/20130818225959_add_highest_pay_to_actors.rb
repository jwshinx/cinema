class AddHighestPayToActors < ActiveRecord::Migration
  def change           
    add_column :actors, :highest_pay, :integer
  end
end
