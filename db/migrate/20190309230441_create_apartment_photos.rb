class CreateApartmentPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :apartment_photos do |t|
      t.string :description
      t.integer :apartment_id
      t.string :photo

      t.timestamps
    end
  end
end
