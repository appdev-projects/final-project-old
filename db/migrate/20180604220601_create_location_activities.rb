class CreateLocationActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :location_activities do |t|
      t.integer :location_id
      t.integer :activity_id
      t.float :feature_rating

      t.timestamps
    end
  end
end
