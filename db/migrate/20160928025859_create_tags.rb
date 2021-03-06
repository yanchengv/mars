class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :tag_type
      t.string :url
      t.boolean :is_disabled,default: true
      t.string :sort
      t.timestamps
    end
  end
end
