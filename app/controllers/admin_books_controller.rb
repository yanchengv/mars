class AdminBooksController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?

  def index

  end

  def show
    @book_menus = BookMenu.admin_book_menus
  end

  def create
    BookMenu.create(book_menu_params)
    redirect_to :back
  end

  private

  def book_menu_params
    params.permit(:name,:url,:parent_id,:code,:book_type,:is_disabled,:description)
  end
end
