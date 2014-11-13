class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.date :memorydate
      t.string :content

      t.timestamps
    end
  end
end
