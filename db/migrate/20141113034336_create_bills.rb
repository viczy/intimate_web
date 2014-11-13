class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :createtime
      t.float :spend
      t.text :detail

      t.timestamps
    end
  end
end
