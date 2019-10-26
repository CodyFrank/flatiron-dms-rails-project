class RemovePasswordDigestFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :password_digest, :string
  end
end
