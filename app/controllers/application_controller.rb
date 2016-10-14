class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  before_action :movie_tags
  include SessionsHelper


  def is_log?
    if !log_in?
        redirect_to '/'
    end
  end

  def is_admin?
    if !current_user.is_admin
      redirect_to '/'
    end
  end


  def movie_tags
    @movie_regions = Tag.where(tag_type: 'region').order(sort: :asc)
    @movie_types = Tag.where(tag_type: 'type').order(sort: :asc)
    @movie_tags = Tag.where(tag_type: 'tag').order(sort: :asc)
  end

end
