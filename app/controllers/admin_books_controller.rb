class AdminBooksController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?

  def index
    @books = Book.all
  end

  def show
    book_id = params[:id]
    @book = Book.find(book_id)
    @book_menus = BookMenu.admin_book_menus book_id
    @book_menu_id = params[:menu_id]
    @book_detail = BookDetail.where(book_menu_id: @book_menu_id).first
    if !@book_detail.nil?
      @book_menu_name = @book_detail.name
      @book_detail_content = @book_detail.content
    else
      @book_menu_name = params[:menu_name]
    end
  end

  def create
    Book.create(book_params)
    redirect_to :back
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to :back
  end

  def delete
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :back
  end

  def create_menu
    BookMenu.create(book_menu_params)
    redirect_to :back
  end

  def update_menu
    @book_menu = BookMenu.find(params[:id])
    @book_menu.update_attributes(book_menu_params)
    redirect_to :back
  end


  def delete_menu
    @book_menu = BookMenu.find(params[:id])
    @book_menu.destroy
    redirect_to :back
  end


  def create_book_detail
    @book_detail = BookDetail.where(book_menu_id: params[:book_menu_id]).first
    if @book_detail.nil?
      @book_detail = BookDetail.create(book_detail_params)
    else
      @book_detail.update_attributes(book_detail_params)
    end
    @book_menu_name = @book_detail.name
    @book_detail_content = @book_detail.content
    redirect_to :back
  end


  private

  def book_params
    params.permit(:name, :book_type, :content, :logo, :is_disabled)
  end

  def book_menu_params
    params.permit(:name, :url, :book_id, :parent_id, :code, :book_type, :is_disabled, :description)
  end

  def book_detail_params
    params.permit(:name, :book_id, :book_type, :book_menu_id, :content, :is_disabled)
  end
end
