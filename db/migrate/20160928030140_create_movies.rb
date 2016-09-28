class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name #  电影名称
      t.integer :sort # 排行
      t.string :movie_tag # 电影类别
      t.string :level # 级别，是否有更多集
      t.string :region #  地区
      t.string :grade  # 评分
      t.string :actors  #演员
      t.string :abstract  #简介
      t.date :year  #年份
      t.string :image_url
      t.timestamps :show_time #上映时间
      t.timestamps :upload_time #上传时间
      t.timestamps null: false
    end
  end
end
