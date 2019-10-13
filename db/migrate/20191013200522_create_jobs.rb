class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :repair_order_id
      t.text :concern
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
