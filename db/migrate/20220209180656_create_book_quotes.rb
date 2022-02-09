class CreateBookQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :book_quotes, if_not_exists: true do |t|
      t.string :quote
      t.string :book_title
      t.references :regular_user, index: true

      t.timestamps
    end
  end
end
