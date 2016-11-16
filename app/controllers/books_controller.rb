class BooksController < ApplicationController
  layout 'book_layout'
  def index

  end

  def show
    #@parent_menus = BookMenu.includes(:sub_book_menus).where(is_disabled: 0, parent_id: 0).order('sort asc')
    @menus = BookMenu.book_menus

  end

  def book_menus
    @parent_menus = BookMenu.includes(:sub_book_menus).where(is_disabled: 0, parent_id: 0)
    parent_menus_arr = []
    @parent_menus.each do |parent_menu|
      parent_menu_atrr = parent_menu.sub_book_menus
      parent_menus_arr.push(parent_menu_atrr)
    end

    render json: parent_menus_arr
  end
end

