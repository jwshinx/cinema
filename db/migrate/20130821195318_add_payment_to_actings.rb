class AddPaymentToActings < ActiveRecord::Migration
  def change             
    add_column :actings, :payment, :integer
  end
end
