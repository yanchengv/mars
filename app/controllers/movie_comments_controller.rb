class MovieCommentsController < ApplicationController

  def create
    MovieComment.create(movie_comment_params)
    redirect_to :back
  end

  private

  def movie_comment_params
     params.require(:movie_comment).permit(:movie_id,:user_id,:content)
  end
end
