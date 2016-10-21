class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :movie_tags
  include SessionsHelper
  #skip_before_action :verify_authenticity_token, raise: false
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
    @movies_newest = Movie.order(created_at: :desc).limit(8)

  end

end
