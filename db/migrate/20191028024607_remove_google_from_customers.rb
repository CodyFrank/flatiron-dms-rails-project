class RemoveGoogleFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :google_token, :string
    remove_column :customers, :google_refresh_token, :string
    add_column :customers, :uid, :string
  end
end
