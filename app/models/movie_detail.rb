=begin
  t.integer :movie_id
      t.integer :episode  #剧集数
      t.string :url #影片下载地址
      t.string :name #剧集名称
=end
class MovieDetail < ApplicationRecord
  belongs_to :movie
end
