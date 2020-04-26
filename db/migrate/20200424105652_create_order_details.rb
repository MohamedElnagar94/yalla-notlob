class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :user_id
      t.string :item
      t.integer :amount
      t.text :desc

      t.timestamps
    end
  end
end
