class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :logic
      t.string :frequency
      t.string :suggested_amount

      t.timestamps
    end
  end
end
