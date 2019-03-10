class CreateAmenityPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :amenity_pictures do |t|
      t.string :picture
      t.string :description
      t.integer :building_amenity_id

      t.timestamps
    end
  end
end
