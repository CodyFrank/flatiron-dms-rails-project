class RemoveGoogleAuth < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :google_token, :string
    remove_column :employees, :google_refresh_token, :string
  end
end
