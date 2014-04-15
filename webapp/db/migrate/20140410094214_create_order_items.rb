class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :num
      t.references :product, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
