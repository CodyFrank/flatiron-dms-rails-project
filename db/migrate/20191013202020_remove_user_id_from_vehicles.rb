class RemoveUserIdFromVehicles < ActiveRecord::Migration[6.0]
  def change
    remove_column :vehicles, :user_id, :integer
  end
end
