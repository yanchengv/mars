class MovieCommentsController < ApplicationController
  before_action :show_title
  def create
    MovieComment.create(movie_comment_params)
    redirect_to :back
  end

  private

  def movie_comment_params
     params.permit(:movie_id,:user_id,:content)
  end
end
