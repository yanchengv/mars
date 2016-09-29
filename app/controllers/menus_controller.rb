class MenusController < ApplicationController


  def sub_menus parent_menu
    if parent_menu.sub_menus.empty?
      sub_atrr = {
          id: parent_menu.id,
          text: parent_menu.name
      }
      return sub_atrr
    else
      children = []
      parent_menu.sub_menus.each do |pm|

          children2 = sub_menu pm
          if children2
            sub_atrr = {
                id: pm.id,
                text: pm.name,
                children: children2
            }

          end

          children.push(sub_atrr)
      end

    end

    parent_atrr = {
        id: parent_menu.id,
        text: parent_menu.name,
        children: children

    }
    return parent_atrr
  end

  def list
    @parent_menus = Menu.where(is_disabled: 1,parent_id: 0)
    parent_menus_arr = []
    @parent_menus.each do |parent_menu|
      parent_menu_atrr = sub_menus parent_menu
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
    p 99999
    p parent_menus_arr
    render json: parent_menus_arr
  end
end
