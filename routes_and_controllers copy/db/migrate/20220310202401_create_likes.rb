class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :source_type, null: false
      t.integer :user_id, null: false
    end
    add_index :likes, :user_id
  end
end
