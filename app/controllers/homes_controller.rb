class HomesController < ApplicationController

  def index
    @selected_region = params[:region].present? ? params[:region] : '全部'
    @selected_movie_tag = params[:movie_tag].present? ? params[:movie_tag] : '全部'
    @selected_movie_type = params[:movie_type].present? ? params[:movie_type] : '全部'
    @movies = Movie.paginate(:page => params[:page], :per_page => 2)
  end
end
