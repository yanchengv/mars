class MoviesController < ApplicationController

  def show
    @movie = Movie.includes(:movie_details).where(id: params[:id])

  end
end
