class AdminNewsController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?

  def new
    @admin_news = News.new
  end

  def index
    current_page = params[:page].present? ? params[:page] : 1
    @admin_news = News.paginate(:page => current_page, :per_page => 30)
  end

  def create
    News.create(news_params)
    redirect_to :back
  end

  def edit
    @admin_news = News.find(params[:id])
  end

  def update
    @admin_news = News.find(params[:news][:id])
    @admin_news.update_attributes(news_params)
    redirect_to :back
  end

  def show
    @admin_news = News.find(params[:id])
  end

  def delete_news
    @news = News.find(params[:id])
    @news.destroy
    redirect_to :back
  end

  private

  def news_params
    params.require(:news).permit(:title, :abstract, :content, :author)
  end
end
