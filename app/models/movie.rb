=begin
 t.string :name #  电影名称
      t.integer :sort # 排行
      t.string :movie_tag # 电影类别
      t.string :level # 剧集，是否有更多集
      t.string :region #  地区
      t.string :grade  # 评分
      t.string :actors  #演员
      t.string :abstract  #简介
      t.date :year  #年份
      t.string :image_url #图片地址
      t.timestamps :show_time #上映时间
      t.timestamps :upload_time #上传时间
=end
class Movie < ApplicationRecord
     has_many :movie_details ,dependent: :destroy
end
