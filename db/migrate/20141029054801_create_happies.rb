class CreateHappiess < ActiveRecord::Migration
  def change
    create_table :happiess do |t|
      t.string :them
      t.string :url
      t.date :create

      t.timestamps
    end
  end
end
