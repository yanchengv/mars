class BookMenu < ApplicationRecord
  has_many :sub_book_menus, -> { where(is_disabled: 0)},foreign_key: 'parent_id',class_name: 'BookMenu',dependent: :destroy
  has_many :sub_admin_book_menus, foreign_key: 'parent_id',class_name: 'BookMenu',dependent: :destroy

  # 前端显示book的菜单
  def self.book_menus
    @parent_menus = BookMenu.includes(:sub_book_menus).where(is_disabled: 0, parent_id: 0)
    parent_menus_arr = []
    @parent_menus.each do |parent_menu|
      parent_menu_atrr = BookMenu.sun_book_menus parent_menu
      parent_menus_arr.push(parent_menu_atrr)
    end
    return parent_menus_arr
  end

  # 后台显示book的菜单
  def self.admin_book_menus
    @parent_menus = BookMenu.includes(:sub_admin_book_menus).where(parent_id: 0)
    parent_menus_arr = []
    @parent_menus.each do |parent_menu|
      parent_menu_atrr = BookMenu.sun_admin_book_menus parent_menu
      parent_menus_arr.push(parent_menu_atrr)
    end
    return parent_menus_arr
  end

  private


  # 递归菜单 前端显示
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



  # 递归菜单 后端显示
  def self.sun_admin_book_menus parent_menu
    if parent_menu.sub_admin_book_menus.empty?
      # 无子菜单
      sub_atrr = {
          id: parent_menu.id,
          name: parent_menu.name,
          url: parent_menu.url,
          code: parent_menu.code,
          book_type: parent_menu.book_type,
          is_disabled: parent_menu.is_disabled,
          description: parent_menu.description,
          sort: parent_menu.sort



      }
      return sub_atrr
    else
      # 有子菜单
      children = []
      parent_menu.sub_admin_book_menus.each do |pm|
        children2 = sun_admin_book_menus pm
        children.push(children2)
      end

    end
    parent_atrr = {
        id: parent_menu.id,
        name: parent_menu.name,
        url: parent_menu.url,
        code: parent_menu.code,
        book_type: parent_menu.book_type,
        is_disabled: parent_menu.is_disabled,
        description: parent_menu.description,
        sort: parent_menu.sort,
        children: children

    }
    return parent_atrr
  end


end
