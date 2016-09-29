class TagsController < ApplicationController
  def show

  end
  def list
    @tags = Tag.all
    render json: @tags
  end
  def create

  end
end
