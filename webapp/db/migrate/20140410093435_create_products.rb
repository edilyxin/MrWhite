class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.decimal :price
      t.string :images
      t.references :store, index: true

      t.timestamps
    end
  end
end
