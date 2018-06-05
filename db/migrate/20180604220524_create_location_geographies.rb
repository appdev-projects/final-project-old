class CreateLocationGeographies < ActiveRecord::Migration[5.1]
  def change
    create_table :location_geographies do |t|
      t.integer :geography_id
      t.integer :location_id

      t.timestamps
    end
  end
end
