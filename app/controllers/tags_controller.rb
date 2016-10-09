class TagsController < ApplicationController
   layout "blank_layout",only:[:show]

  def show

    render 'show'
  end



  def list
    @tags = Tag.all
    render json: @tags
  end

  def create

  end
end
