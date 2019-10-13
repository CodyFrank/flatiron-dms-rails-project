class CreateRepairOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :repair_orders do |t|
      t.integer :user_id
      t.integer :vehicle_id
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
