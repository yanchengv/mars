class HomesController < ApplicationController

  def index
    @movies = Movie.all
  end
end
