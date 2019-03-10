class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.integer :user_id
      t.string :description
      t.string :floor_plan
      t.integer :building_id
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :sq_footage
      t.string :orientation
      t.integer :floor

      t.timestamps
    end
  end
end
