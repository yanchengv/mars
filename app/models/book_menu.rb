class BookMenu < ApplicationRecord
  has_many :sub_book_menus, -> { where(is_disabled: 0)},foreign_key: 'parent_id',class_name: 'BookMenu',dependent: :destroy


  def self.book_menus
    @parent_menus = BookMenu.includes(:sub_book_menus).where(is_disabled: 0, parent_id: 0)
    parent_menus_arr = []
    @parent_menus.each do |parent_menu|
      parent_menu_atrr = BookMenu.sun_book_menus parent_menu
      parent_menus_arr.push(parent_menu_atrr)
    end
    return parent_menus_arr
  end
  private


  # 递归菜单
  def self.sun_book_menus parent_menu
    if parent_menu.sub_book_menus.empty?
      # 无子菜单
      sub_atrr = {
          id: parent_menu.id,
          name: parent_menu.name,
          url: parent_menu.url
      }
      return sub_atrr
    else
      # 有子菜单
      children = []
      parent_menu.sub_book_menus.each do |pm|
        children2 = sun_book_menus pm
        children.push(children2)
      end

    end
    parent_atrr = {
        id: parent_menu.id,
        name: parent_menu.name,
        children: children

    }
    return parent_atrr
  end
end
