class AddAvatarToRegularUser < ActiveRecord::Migration[6.1]
  def change
    add_column :regular_users, :avatar, :string
  end
end
