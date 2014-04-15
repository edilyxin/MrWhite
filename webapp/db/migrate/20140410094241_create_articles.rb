class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
