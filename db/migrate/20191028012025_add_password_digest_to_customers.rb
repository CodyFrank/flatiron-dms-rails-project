class AddPasswordDigestToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :google_token, :string
    add_column :customers, :google_refresh_token, :string
    add_column :customers, :password_digest, :string
  end
end
