class RemoveUserIdFromRepairOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :repair_orders, :user_id, :integer
  end
end
