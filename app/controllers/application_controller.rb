class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  before_action :movie_tags
  include SessionsHelper

  def is_log?
    if !log_in?
        redirect_to '/'
    end
  end

  def is_admin?
    if !current_user.is_admin
      redirect_to '/'
    end
  end


  def movie_tags
    @movie_tags,@movie_types,@movie_regions,@movie_menus=Tag.get_tags
    @movies_newest = Movie.order(created_at: :desc).limit(10)
    @news_newest =  News.order(created_at: :desc).limit(10)
  end

  def show_title
    @layout_title = '扒拉我网站-迅雷电影下载-IT培训视频-扒拉我电影-扒新闻-balawo'
  end


end
