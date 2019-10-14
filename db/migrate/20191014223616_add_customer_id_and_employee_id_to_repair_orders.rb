class AddCustomerIdAndEmployeeIdToRepairOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :repair_orders, :customer_id, :integer
    add_column :repair_orders, :employee_id, :integer
  end
end
