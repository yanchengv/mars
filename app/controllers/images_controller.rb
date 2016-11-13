require 'open-uri'
class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    # 上传本地图片
    uploader = AvatarUploader.new
    test = uploader.store!(File.open(params[:image][:file]))

  end

  def upload_remote_by_url
    # 根据url地址，上传远程图片
    uploader = AvatarUploader.new
    remote_img_url = open(params[:image][:url])
    uploader.download! (remote_img_url)
    uploader.store!
  end

  private
  def image_params
    params.permit(:url)
  end

end
