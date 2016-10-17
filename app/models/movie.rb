=begin
  t.string :name #  电影名称
      t.integer :sort # 排行
      t.string :movie_tag # 电影标签 犯罪，恐怖等等
      t.string :movie_type #电影类型 电视剧，电影，综艺等等
      t.string :number # 集数
      t.string :region #  地区
      t.string :grade  # 评分
      t.string :actors  #演员
      t.string :abstract  #简介
      t.string :image_url
      t.date :show_time #上映时间
=end
class Movie < ApplicationRecord
     has_many :movie_details ,dependent: :destroy
     has_many :movie_comments,dependent: :destroy
end
