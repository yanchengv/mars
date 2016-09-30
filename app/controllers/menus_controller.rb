class MenusController < ApplicationController
  layout "blank_layout", only: [:show]

  def list
    @parent_menus = Menu.includes(:sub_menus).where(is_disabled: 1, parent_id: 0)
    parent_menus_arr = []
    @parent_menus.each do |parent_menu|
      parent_menu_atrr = sub_menus parent_menu
      # 生成easyui-tree的数据格式
      parent_menus_arr.push(parent_menu_atrr)
    end


    render json: parent_menus_arr
  end

  def grid_list
    @menus = Menu.all()
    render json: @menus
  end

  def show

  end

  private

  # 递归菜单
  def sub_menus parent_menu

    if parent_menu.sub_menus.empty?
      # 无子菜单
      sub_atrr = {
          id: parent_menu.id,
          text: parent_menu.name,
          attributes: {
              url: parent_menu.url
          }
      }
      return sub_atrr
    else
      # 有子菜单
      children = []
      parent_menu.sub_menus.each do |pm|
        children2 = sub_menus pm
        children.push(children2)
      end

    end

    state = 'open'
    if !parent_menu.is_state
      state = 'closed'
    end
    parent_atrr = {
        id: parent_menu.id,
        text: parent_menu.name,
        state: state,
        children: children

    }
    return parent_atrr
  end
end
