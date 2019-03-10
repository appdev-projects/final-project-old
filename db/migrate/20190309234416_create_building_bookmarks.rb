class CreateBuildingBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :building_bookmarks do |t|
      t.integer :building_id
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
