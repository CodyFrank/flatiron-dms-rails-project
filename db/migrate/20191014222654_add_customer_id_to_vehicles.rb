class AddCustomerIdToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :customer_id, :integer
  end
end
