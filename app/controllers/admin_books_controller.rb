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

  def update
    @book_menu = BookMenu.find(params[:id])
    @book_menu.update_attributes(book_menu_params)
    redirect_to :back
  end


  def delete
    @book_menu = BookMenu.find(params[:id])
    @book_menu.destroy
    redirect_to :back
  end

  def show_book_content
    @book_menus = BookMenu.admin_book_menus
    @book_content = params[:name]
    render 'admin_books/show'
  end
  private

  def book_menu_params
    params.permit(:name, :url, :parent_id, :code, :book_type, :is_disabled, :description)
  end
end
