class AdminTagsController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?
  def index
    @tags = Tag.paginate(:page => params[:page], :per_page => 30)
  end


  def create
    Tag.create(tag_params)
    redirect_to :back
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update_attributes(tag_params)
    redirect_to :back
  end

  def delete_tag
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to :back
  end

  def list
    @tags = Tag.all
    render json: @tags
  end


  private

  def tag_params
    params.permit(:name,:tag_type,:sort,:url,:is_disabled)
  end
end
