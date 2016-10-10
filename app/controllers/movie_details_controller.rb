class MovieDetailsController < ApplicationController
  layout "blank_layout", only: [:show]

  def show
   @movie_id = params[:movie_id]
  end

  def create
    MovieDetail.create(movie_details_params)
    render json: {success: true}
  end

  def update
    @movie_detail = MovieDetail.find(params[:id])
    @movie_detail.update_attributes(movie_details_params)
    render json: {success: true}
  end

  def delete_movie_detail
    @movie_detail = MovieDetail.find(params[:id])
    flag = @movie_detail.destroy
    if flag
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
    params.permit(:name,:url,:movie_id,:episode)
  end
end


