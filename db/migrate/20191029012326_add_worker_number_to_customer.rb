class AddWorkerNumberToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :worker_number, :string, :default => nil
  end
end
