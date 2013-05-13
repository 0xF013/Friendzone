class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :item_id
      t.string :item_type
      t.text :content
      t.belongs_to :user
      t.timestamps
    end
  end
end
