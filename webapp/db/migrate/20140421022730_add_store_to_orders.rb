class AddStoreToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :store, :reference
  end
end
