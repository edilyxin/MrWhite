class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :contacter
      t.string :tel
      t.string :address
      t.string :other
      t.references :user, index: true

      t.timestamps
    end
  end
end
