class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :neighborhood
      t.float :address_latitude
      t.float :address_longitude

      t.timestamps
    end
  end
end
