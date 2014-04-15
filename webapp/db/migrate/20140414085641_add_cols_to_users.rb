class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :openid, :string
    add_column :users, :weixin_nickname, :string
    add_column :users, :tel, :string
    add_reference :users, :locate, index: true
    add_column :users, :type, :integer
  end
end
