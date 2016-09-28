class MoviesController < ApplicationController

  def create

    Movie.create(params)

    render json:{status: 'ok'}

  end
end
