class HomesController < ApplicationController

  def index
    @movies = Movie.paginate(:page => params[:page], :per_page => 2)
  end
end
