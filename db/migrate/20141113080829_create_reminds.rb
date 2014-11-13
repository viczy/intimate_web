class CreateReminds < ActiveRecord::Migration
  def change
    create_table :reminds do |t|
      t.datetime :alarm
      t.string :address
      t.text :content

      t.timestamps
    end
  end
end
