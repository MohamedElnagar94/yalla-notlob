class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :order_users, :status, :notify
  end
end
