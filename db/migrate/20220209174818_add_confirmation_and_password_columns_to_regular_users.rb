class AddConfirmationAndPasswordColumnsToRegularUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :regular_users, :confirmation, :string
    add_column :regular_users, :password_digest, :string, null: false
  end
end
