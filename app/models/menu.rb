=begin
t.string :name #菜单名称
t.string :parent_id
t.string :url #地址
t.string :code #识别码
t.string :description #菜单描述
=end

class Menu < ApplicationRecord
  has_many :sub_menus, -> { where(is_disabled: 0)},foreign_key: 'parent_id',class_name: 'Menu',dependent: :destroy
end
