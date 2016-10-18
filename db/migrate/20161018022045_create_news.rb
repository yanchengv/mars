class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content #内容
      t.string :abstract #内容简介
      t.string :author
      t.timestamps
    end
  end
end
