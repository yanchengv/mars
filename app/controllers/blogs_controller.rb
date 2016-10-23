class BlogsController < ApplicationController
  layout 'news_layout'
  def index
    @layout_title = '博客-'
  end
end
