class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_for
      t.text :resturant_name
      t.string :firend
      t.string :picture

      t.timestamps
    end
  end
end
