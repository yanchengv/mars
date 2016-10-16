class AdminHomesController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?
  def index
    current_page = params[:page].present? ? params[:page] : 1
    per_page = params[:rows].present? ? params[:rows] : 15
    @movies = Movie.paginate(:page => current_page, :per_page => per_page)
  end
end
