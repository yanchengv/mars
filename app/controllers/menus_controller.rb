class MenusController < ApplicationController



  def list
    @parent_menus = Menu.where(is_disabled: 1,parent_id: 0)
    parent_menus_arr = []
    @parent_menus.each do |parent_menu|
      parent_menu_atrr = sub_menus parent_menu
      # 生成easyui-tree的数据格式
      parent_menus_arr.push(parent_menu_atrr)
    end


    # menus = [{
    #                      "id":11,
    #                      "text":"生活",
    #                      "state":"open",
    #                      "children":[{
    #                                      "id":111,
    #                                      "text":"标签管理"
    #                                  },{
    #                                      "id":112,
    #                                      "text":"菜单管理"
    #                                  }]
    #                  },{
    #                      "id":12,
    #                      "text":"电影",
    #                      "children":[{
    #                                      "id":121,
    #                                      "text":"大陆"
    #                                  },{
    #                                      "id":122,
    #                                      "text":"欧美",
    #                                      "attributes":{
    #                                          "p1":"Custom Attribute1",
    #                                          "p2":"Custom Attribute2"
    #                                      }
    #                                  },{
    #                                      "id":123,
    #                                      "text":"日韩"
    #                                  }]
    #                  },{
    #                      "id":13,
    #                      "text":"关于"
    #                  }]
    #
    render json: parent_menus_arr
  end


  private

  # 递归菜单
  def sub_menus parent_menu

    if parent_menu.sub_menus.empty?
      # 无子菜单
      sub_atrr = {
          id: parent_menu.id,
          text: parent_menu.name
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
