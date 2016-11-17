class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :book_type
      t.text :content
      t.string :logo
      t.timestamps
    end
  end
end
