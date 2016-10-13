class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  before_action :movie_tags

  def movie_tags
     @movie_regions = Tag.where(tag_type: 'region').order(sort: :asc)
     @movie_types = Tag.where(tag_type: 'type').order(sort: :asc)
     @movie_tags = Tag.where(tag_type: 'tag').order(sort: :asc)
  end

end
