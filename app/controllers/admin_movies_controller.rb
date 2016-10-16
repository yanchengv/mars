class AdminMoviesController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?
  def create
    Movie.create(movie_params)

    redirect_to :back

  end


  def index
    current_page = params[:page].present? ? params[:page] : 1
    per_page = params[:rows].present? ? params[:rows] : 15
    @movie_tags = Tag.where(tag_type: 'tag').order(sort: :asc)
    @movie_types = Tag.where(tag_type: 'type').order(sort: :asc)
    @movie_regions = Tag.where(tag_type:'region').order(sort: :asc)
    @movies = Movie.paginate(:page => current_page, :per_page => per_page)
  end

  def show
    @movie = Movie.includes(:movie_details).where(id: params[:id]).first
  end

  def get_movie_by_id
    @movie = Movie.includes(:movie_details).where(id: params[:movie_id]).first
    render json: @movie
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @movie.update_attributes(movie_params)
   redirect_to :back
  end

  def delete_movie
    @movie = Movie.find(params[:id])
    flag = @movie.destroy
    if flag
      message = {success: true}
    else
      message = {success: false, errorMsg: '删除失败'}
    end
    render json: message
  end


  def list
    @movies = Movie.paginate(:page => params[:page], :per_page => params[:rows])
    render json: @movies
  end

  private

  def movie_params
    params.permit(:name, :sort, :region, :grade, :actors, :abstract, :image_url, :show_time, :movie_tag, :movie_type,:number)
  end
end
