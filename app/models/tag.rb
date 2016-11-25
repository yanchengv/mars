class Tag < ApplicationRecord

  def self.get_tags
    movie_tags = Tag.where(tag_type: 'tag',is_disabled: false).order(sort: :asc)
    movie_types = Tag.where(tag_type: 'type',is_disabled: false).order(sort: :asc)
    movie_regions = Tag.where(tag_type: 'region',is_disabled: false).order(sort: :asc)
    movie_menus = Tag.where(tag_type: 'menu',is_disabled: false).order(sort: :asc)
    return movie_tags, movie_types, movie_regions,movie_menus
  end

end
