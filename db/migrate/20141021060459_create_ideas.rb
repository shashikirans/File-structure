class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps
    end
    add_index :assets, :user_id
  end
end
