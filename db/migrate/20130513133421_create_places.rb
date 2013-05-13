class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
    add_index :places, :user_id
  end
end
