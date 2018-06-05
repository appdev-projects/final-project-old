class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city_name
      t.string :state_name
      t.string :country_name
      t.float :lat
      t.float :long
      t.string :image

      t.timestamps
    end
  end
end
