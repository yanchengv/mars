class CreateBookMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :book_menus do |t|

      t.timestamps
    end
  end
end
