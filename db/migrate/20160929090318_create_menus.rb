class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name #菜单名称
      t.string :parent_id
      t.string :url #地址
      t.string :code #识别码
      t.boolean :is_disabled #是否禁用
      t.string :description #菜单描述
      t.timestamps
    end
  end
end
