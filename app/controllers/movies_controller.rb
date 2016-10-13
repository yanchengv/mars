class MoviesController < ApplicationController

  def show
    @movie = Movie.includes(:movie_details).where(id: params[:id]).first
  end

  def get_movies
    conditions = []
    values = []
    if params[:region].present?
      conditions << "region = ?"
      values << params[:region]
    end

    if params[:movie_tag].present?
      conditions << "movie_tag like ? "
      values << "%#{params[:movie_tag]}%"
    end

    @movies = Movie.includes(:movie_details).where(conditions.join('or'),*values)
    render 'homes/index'
  end


end
