class CreateMovieComments < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_comments do |t|
      t.string :movie_id
      t.string :user_id
      t.text :content
      t.timestamps
    end
  end
end
