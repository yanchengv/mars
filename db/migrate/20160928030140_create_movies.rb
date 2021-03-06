class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name #  电影名称
      t.integer :sort # 排行
      t.string :movie_tag # 电影标签
      t.string :movie_type #电影类型 电视剧，电影，综艺等等
      t.string :number # 集数
      t.string :region #  地区
      t.string :grade  # 评分
      t.text :actors  #演员
      t.text :abstract  #简介
      t.text :image_url
      t.boolean :is_all,default: true #是否全集
      t.date :show_time #上映时间
      t.timestamps null: false
    end
  end
end
