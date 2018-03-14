class CreateLocalEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :local_events do |t|
      t.string :event_name
      t.date :date
      t.string :city

      t.timestamps
    end
  end
end
