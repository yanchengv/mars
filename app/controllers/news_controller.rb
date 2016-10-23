class NewsController < ApplicationController
  layout 'news_layout'
  def index
    @news = News.paginate(:page => params[:page], :per_page => 30)
    @layout_title = '扒新闻-'
  end

  def show
    @news = News.find(params[:id])
    @layout_title = @news.title + '-'

  end


end
