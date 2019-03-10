class CreateBuildingAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :building_amenities do |t|
      t.integer :building_id
      t.integer :amenity_id

      t.timestamps
    end
  end
end
