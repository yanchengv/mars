=begin

=end
class CreateMovieDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_details do |t|
      t.integer :movie_id
      t.integer :episode  #剧集数
      t.string :url
      t.string :url2
      t.string :name
      t.timestamps
    end
  end
end
