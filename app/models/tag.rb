class Tag < ApplicationRecord

  def self.get_tags
    movie_tags = Tag.where(tag_type: 'tag').order(sort: :asc)
    movie_types = Tag.where(tag_type: 'type').order(sort: :asc)
    movie_regions = Tag.where(tag_type: 'region').order(sort: :asc)
    return movie_tags, movie_types, movie_regions
  end

end
