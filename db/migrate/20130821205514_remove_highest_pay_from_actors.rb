class RemoveHighestPayFromActors < ActiveRecord::Migration
  def up
    remove_column :actors, :highest_pay
  end

  def down
    add_column :actors, :highest_pay, :integer
  end
end
