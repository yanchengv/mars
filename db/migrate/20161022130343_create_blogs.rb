class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :tag #文章标签
      t.string :abstract #内容简介
      t.string :author #作者
      t.text :content #内容
      t.timestamps
    end
  end
end
