class AdminMovieDetailsController < ApplicationController
  layout "admin_layout",except: [:index]
  before_action :is_log?
  before_action :is_admin?
  def index
   @movie_id = params[:movie_id]

   render 'index',layout: 'blank_layout'
  end

  def show
      @movie_detail = MovieDetail.find(params[:id])
      render json: @movie_detail
  end
  def create
    @movie_detail = MovieDetail.create(movie_details_params)
    @movie = Movie.includes(:movie_details).where(id: @movie_detail.movie_id).first
    @movie.update_attributes({number: @movie.movie_details.length})
    redirect_to :back
  end

  def update
    @movie_detail = MovieDetail.find(params[:movie_detail_id])
    @movie_detail.update_attributes(movie_details_params)
    redirect_to :back
  end

  def delete_movie_detail
    @movie_detail = MovieDetail.find(params[:id])
    movie_id = @movie_detail.movie_id
    flag = @movie_detail.destroy
    if flag
      @movie = Movie.includes(:movie_details).where(id: movie_id).first
      @movie.update_attributes({number: @movie.movie_details.length})
    end

    redirect_to :back
  end

  def list
    @movie_detail_list = MovieDetail.where(movie_id: params[:movie_id])
    render json: @movie_detail_list
  end

  private

  def movie_details_params
    params.permit(:name,:name2,:url,:url2,:wangpan_url,:wangpan_password,:movie_id,:episode)
  end
end


