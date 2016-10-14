class AdminMovieDetailsController < ApplicationController
  layout "admin_layout",except: [:index]
  def index
   @movie_id = params[:movie_id]

   render 'index',layout: 'blank_layout'
  end

  def create
    @movie_detail = MovieDetail.create(movie_details_params)
    @movie = Movie.includes(:movie_details).where(id: @movie_detail.movie_id).first
    @movie.update_attributes({number: @movie.movie_details.length})
    render json: {success: true}
  end

  def update
    @movie_detail = MovieDetail.find(params[:id])
    @movie_detail.update_attributes(movie_details_params)
    render json: {success: true}
  end

  def delete_movie_detail
    @movie_detail = MovieDetail.find(params[:id])
    movie_id = @movie_detail.movie_id
    flag = @movie_detail.destroy
    if flag
      @movie = Movie.includes(:movie_details).where(id: movie_id).first
      @movie.update_attributes({number: @movie.movie_details.length})
      message = {success: true}
    else
      message = {success: false, errorMsg: '删除失败'}
    end
    render json: message
  end

  def list
    @movie_detail_list = MovieDetail.where(movie_id: params[:movie_id])
    render json: @movie_detail_list
  end

  private

  def movie_details_params
    params.permit(:name,:url,:url2,:wangpan_url,:wangpan_password,:movie_id,:episode)
  end
end


