class CreateApartmentBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :apartment_bookmarks do |t|
      t.integer :user_id
      t.integer :apartment_id
      t.string :name

      t.timestamps
    end
  end
end
