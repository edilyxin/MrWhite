class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user
      t.references :sotre
      t.references :order

      t.timestamps
    end
  end
end
