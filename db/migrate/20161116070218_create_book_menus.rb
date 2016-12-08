class CreateBookMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :book_menus do |t|
      t.string :name #菜单名称
      t.string :parent_id #父菜单id
      t.integer :book_id #book表的外键
      t.string :url #地址
      t.string :code #识别码
      t.integer :sort #排序
      t.string :book_type #书籍类型
      t.boolean :is_disabled,:default => 0 #是否禁用 0：不禁用,1:禁用
      t.string :description #菜单描述
      t.timestamps
    end
  end
end
