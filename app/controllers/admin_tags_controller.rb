class AdminTagsController < ApplicationController
  layout "admin_layout",except: [:index]
  def index

    render 'index',layout: 'blank_layout'
  end


  def create
    flag = Tag.create(tag_params)
    render json: {success: flag}
  end


  def update
    @tag = Tag.find(params[:id])
    @tag.update_attributes(tag_params)
    render json: {success: true}
  end

  def delete_tag
    @tag = Tag.find(params[:id])
    @tag.destroy
    render json: {success: true}
  end

  def list
    @tags = Tag.all
    render json: @tags
  end


  private

  def tag_params
    params.permit(:name)
  end
end
