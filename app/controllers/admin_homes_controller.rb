class AdminHomesController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?
  def index

  end
end
