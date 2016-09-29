class MoviesController < ApplicationController
  def create

    Movie.create(movie_params)

    render json: {status: 'ok'}

  end


  def show
    @movies = Movie.all

    render json: @movies
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    render json:{success:true}
  end

  def delete_movie
    @movie = Movie.find(params[:id])
    flag = @movie.destroy
    if flag
      message = {success: true}
    else
      message = {success: false,errorMsg: '删除失败'}
    end
    render json: message
  end

  private

  def movie_params
    params.permit(:name, :sort, :region, :level, :grade, :actors, :abstract, :image_url, :show_time, :movie_tag)
  end
end
