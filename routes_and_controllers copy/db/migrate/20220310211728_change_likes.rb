class ChangeLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :source_id, :integer, null: false
  end
end
