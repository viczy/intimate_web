class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string #为users添加列password_digest,字符串类型
  end
end
