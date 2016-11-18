class BooksController < ApplicationController
  layout 'book_layout'

  def index
    @books = Book.where(is_disabled: false)
  end

  def show
    book_id = params[:id]
    @book = Book.find(book_id)
    @book_menus = BookMenu.book_menus book_id
    @book_menu_id = params[:menu_id]
    @book_detail = BookDetail.where(book_menu_id: @book_menu_id).first
    if !@book_detail.nil?
      @book_menu_name = @book_detail.name
      @book_detail_content = @book_detail.content
    else
      @book_detail_content = '### 欢迎来到扒拉图书社!
### 每天一本编程书，每天进步一点点!'
    end

  end

end

