class NewsController < ApplicationController
  layout 'news_layout'
  def index
    @news = News.order(created_at: :desc).paginate(:page => params[:page], :per_page => 30)
    @layout_title = '扒新闻-扒拉我网站-迅雷电影下载-IT培训视频-扒拉我电影-balawo'
  end

  def show
    @news = News.find(params[:id])
    @layout_title = @news.title

  end


end
