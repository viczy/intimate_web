class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true #为users表的email列建立索引，并验证唯一性
  end
end
