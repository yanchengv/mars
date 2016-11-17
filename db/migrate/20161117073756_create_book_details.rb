class CreateBookDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :book_details do |t|
      t.string :name
      t.integer :book_menu_id
      t.text :content
      t.boolean :is_disabled
      t.timestamps
    end
  end
end
