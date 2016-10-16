=begin
  t.integer :movie_id
      t.integer :episode  #剧集数
        t.string :url #影片下载地址1
      t.string :url2 #影片下载地址2
      t.string :name #剧集名称
      t.string :wangpan_url #网盘地址
      t.string :wangpan_password #网盘密码
=end
class MovieDetail < ApplicationRecord
  belongs_to :movie
end
