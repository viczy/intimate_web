class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :remember_token, :string #为user添加remember_token，类型为字符串
  	add_index :users, :remember_token #给remember_token添加索引
  end
end
