class ChangeWorkerIdToWorkerNumber < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :worker_id, :integer
    add_column :employees, :worker_number, :string
  end
end
