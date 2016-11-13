class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :url
      t.string :content
      t.timestamps
    end
  end
end
