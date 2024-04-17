class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :img_url
      t.date :published_date
      t.boolean :highlight,default: false
      t.string :category
      t.string :permalink

      t.timestamps
    end
  end
end
