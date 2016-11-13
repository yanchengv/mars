require 'open-uri'
class ImagesController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?
  def new
    @image = Image.new
  end

  def index
    current_page = params[:page].present? ? params[:page] : 1
    per_page = 30
    @images = Image.paginate(:page => current_page, :per_page => per_page)
  end
  def create
    # 上传本地图片
    image = Image.new ({name: params[:image][:name],
                content: params[:image][:content]})
    image.url = params[:image][:file]
    image.save!
    redirect_to :back
  end

  def show_delete
    @image = Image.find(params[:id])
  end
  def delete_img
    @image = Image.find(params[:image][:id])
    @image.remove_url!
    @image.destroy

    redirect_to '/images'
  end

  def remote_upload
    # 根据url地址，上传远程图片
    uploader = AvatarUploader.new
    remote_img_url = open(params[:image][:url])
    uploader.download! (remote_img_url)
    uploader.store!
  end

  private
  def image_params
    params.permit(:name,:content,:url)
  end

end