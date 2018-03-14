class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :city
      t.string :event_name
      t.date :date
      t.text :description
      t.integer :host_id

      t.timestamps
    end
  end
end
