class AdminMenusController < ApplicationController
  layout "admin_layout",except: [:index]
  before_action :is_log?
  before_action :is_admin?
  def index

    render 'index',layout: 'blank_layout'
  end

  def create
    flag = Menu.create(menu_params)
    render json: {success: flag}
  end


  def update
    @menu = Menu.find(params[:id])
    flag = @menu.update_attributes(menu_params)
    render json: {success: flag}
  end

  def delete_menu
    @menu = Menu.find(params[:id])
    flag = @menu.destroy
    if flag
      message = {success: true}
    else
      message = {success: false, errorMsg: '删除失败'}
    end
    render json: message
  end

  def list
    @parent_menus = Menu.includes(:sub_menus).where(is_disabled: 0, parent_id: 0)
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

  def menu_params
    params.permit(:name, :url, :code, :description, :is_disabled, :is_state, :parent_id)

  end
end
