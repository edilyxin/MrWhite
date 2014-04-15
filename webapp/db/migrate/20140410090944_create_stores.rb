class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.string :address
      t.string :tel
      t.string :logo
      t.string :area
      t.references :user, index: true
      t.references :locate, index: true
      t.references :productCatalog, index: true

      t.timestamps
    end
  end
end
