class AdminBooksController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?

  def index

  end

  def show
    @book_menus = BookMenu.book_menus
  end
end
