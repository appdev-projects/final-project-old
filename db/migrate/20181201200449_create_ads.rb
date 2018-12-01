class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :location

      t.timestamps
    end
  end
end
