class CreateRegularUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :regular_users do |t|
      t.string :email, null: false
      t.string :nickname
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
      
    end
    add_index :regular_users, :email, unique: true
  end
end
