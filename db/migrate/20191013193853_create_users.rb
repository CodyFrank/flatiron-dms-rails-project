class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :phone_number
      t.string :email
      t.boolean :employee, default: false

      t.timestamps
    end
  end
end
