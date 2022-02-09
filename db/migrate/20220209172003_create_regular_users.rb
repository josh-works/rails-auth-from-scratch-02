class CreateRegularUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :regular_users do |t|
      t.string :email
      t.string :nickname
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
