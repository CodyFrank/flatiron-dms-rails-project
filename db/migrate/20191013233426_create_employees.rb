class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :worker_id
      t.string :job_title
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
