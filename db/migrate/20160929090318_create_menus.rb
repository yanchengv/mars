class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name #菜单名称
      t.string :parent_id #父菜单id
      t.string :url #地址
      t.string :code #识别码
      t.boolean :is_state,:default => 1 #此节点的菜单树是否展开 0:不展开.1:展开
      t.boolean :is_disabled,:default => 0 #是否禁用 0：不禁用,1:禁用
      t.string :description #菜单描述
      t.timestamps
    end
  end
end
