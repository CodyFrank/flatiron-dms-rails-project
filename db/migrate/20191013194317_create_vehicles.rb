class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :miles
      t.integer :user_id
      t.string :vin

      t.timestamps
    end
  end
end
