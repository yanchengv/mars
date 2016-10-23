=begin

=end
class CreateMovieDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_details do |t|
      t.integer :movie_id
      t.string :episode  #剧集数
      t.text :url
      t.text :url2
      t.string :wangpan_url #网盘地址
      t.string :wangpan_password #网盘密码
      t.string :name
      t.timestamps
    end
  end
end
