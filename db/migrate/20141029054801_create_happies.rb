class CreateHappies < ActiveRecord::Migration
  def change
    create_table :happies do |t|
      t.string :them
      t.string :url
      t.date :create

      t.timestamps
    end
  end
end
