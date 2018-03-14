class CreateSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :signups do |t|
      t.integer :event_id
      t.integer :tourist_id

      t.timestamps
    end
  end
end
